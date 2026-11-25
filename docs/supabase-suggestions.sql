-- Pomalo: "Suggest a better sentence"
-- Paste into: Supabase → SQL Editor → New query → Run (once)
--
-- Learners (testers, native speakers) can send a better version of a sentence.
-- Only the person who sent it and the course owner (admin) can read it.
-- Only the owner can mark it done. Nothing in the lessons changes by itself.

create table if not exists public.suggestions (
  id          uuid primary key default gen_random_uuid(),
  parent_id   uuid not null default auth.uid() references auth.users (id) on delete cascade,
  learner_id  uuid references public.learners (id) on delete cascade,
  learner_name text not null default '' check (char_length(learner_name) <= 60),
  item_key    text not null check (char_length(item_key) <= 40),
  lang        text not null check (char_length(lang) <= 5),
  course      text not null check (course in ('sr', 'en')),
  dialect     text not null default 'ek' check (dialect in ('ek', 'ij')),
  lesson      int  not null check (lesson between 1 and 200),
  old_prompt  text not null check (char_length(old_prompt) <= 400),
  old_answer  text not null check (char_length(old_answer) <= 400),
  new_prompt  text not null check (char_length(new_prompt) <= 400),
  new_answer  text not null check (char_length(new_answer) <= 400),
  note        text not null default '' check (char_length(note) <= 400),
  status      text not null default 'new' check (status in ('new', 'done')),
  created_at  timestamptz not null default now()
);

alter table public.suggestions enable row level security;

drop policy if exists "send own suggestions" on public.suggestions;
create policy "send own suggestions" on public.suggestions
  for insert to authenticated
  with check (parent_id = auth.uid() and status = 'new'
    and (learner_id is null or exists (select 1 from public.learners l where l.id = learner_id and l.parent_id = auth.uid())));

drop policy if exists "read own or admin" on public.suggestions;
create policy "read own or admin" on public.suggestions
  for select to authenticated
  using (parent_id = auth.uid() or public.is_admin());

drop policy if exists "admin marks done" on public.suggestions;
create policy "admin marks done" on public.suggestions
  for update to authenticated
  using (public.is_admin()) with check (public.is_admin());

drop policy if exists "delete own or admin" on public.suggestions;
create policy "delete own or admin" on public.suggestions
  for delete to authenticated
  using (parent_id = auth.uid() or public.is_admin());
