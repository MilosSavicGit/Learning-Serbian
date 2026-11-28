// Pomalo service worker: online, always the newest page and lessons; offline, the last copy.
// Voice clips, fonts and icons never change once published, so they are kept after the first play.
const PAGES = 'pomalo-pages-v1', MEDIA = 'pomalo-media-v1';
self.addEventListener('install', e => { self.skipWaiting(); e.waitUntil(caches.open(PAGES).then(c => c.addAll(['./', 'manifest.webmanifest', 'icons/icon-192.png']))); });
self.addEventListener('activate', e => {
  e.waitUntil(caches.keys().then(keys => Promise.all(keys.filter(k => ![PAGES, MEDIA].includes(k)).map(k => caches.delete(k)))).then(() => self.clients.claim()));
});
self.addEventListener('fetch', e => {
  const req = e.request, url = new URL(req.url);
  if (req.method !== 'GET' || url.origin !== location.origin) return; // sign-in and database calls go straight to the network
  const media = /\/(audio|fonts|icons)\//.test(url.pathname);
  if (media) {
    e.respondWith(caches.open(MEDIA).then(async c => (await c.match(req)) || fetch(req).then(r => { if (r.ok) c.put(req, r.clone()); return r; })));
    return;
  }
  e.respondWith(fetch(req).then(r => { if (r.ok) caches.open(PAGES).then(c => c.put(req, r.clone())); return r; })
    .catch(() => caches.match(req).then(m => m || (req.mode === 'navigate' ? caches.match('./') : Response.error()))));
});
