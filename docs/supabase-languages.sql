-- Pomalo: more languages next to Serbian (Italian, Danish, French, Spanish, German)
-- Paste into: Supabase → SQL Editor → New query → Run (once)
-- Existing learners keep English; new learners can choose Italian.

alter table public.learners
  add column if not exists lang text not null default 'en';

alter table public.learners drop constraint if exists learners_lang_check;
alter table public.learners
  add constraint learners_lang_check check (lang in ('en', 'it', 'da', 'fr', 'es', 'de'));
