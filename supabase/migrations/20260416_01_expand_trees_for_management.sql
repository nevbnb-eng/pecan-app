-- Add orchard management fields to trees.

begin;

alter table public.trees
    add column if not exists health_status text,
    add column if not exists irrigation_zone text,
    add column if not exists tree_notes text,
    add column if not exists photo_url text;

commit;
