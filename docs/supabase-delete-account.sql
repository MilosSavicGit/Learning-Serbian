-- Pomalo: let a signed-in parent or adult delete their own account
-- Paste into: Supabase → SQL Editor → New query → Run (once)
--
-- Deletes the caller's learners (their progress and activity go with them)
-- and then the sign-in account itself. Nobody can delete anyone else's account:
-- the function only ever uses the id of the person who is signed in.

create or replace function public.delete_my_account() returns void
language plpgsql security definer set search_path = public, auth as $$
begin
  if auth.uid() is null then
    raise exception 'not signed in';
  end if;
  delete from public.learners where parent_id = auth.uid();
  delete from auth.users where id = auth.uid();
end $$;

revoke all on function public.delete_my_account() from public, anon;
grant execute on function public.delete_my_account() to authenticated;
