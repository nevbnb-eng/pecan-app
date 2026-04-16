# Deploying These Supabase Migrations

Project ref inferred from your Supabase URL: `etqenbfxzyhpcpudmlqo`

## Files to deploy

Run these in this order:

1. `supabase/migrations/20260416_01_expand_trees_for_management.sql`
2. `supabase/migrations/20260416_02_create_irrigation_assets.sql`
3. `supabase/migrations/20260416_03_expand_work_orders_and_targets.sql`

## Easiest path if you are not comfortable with CLI yet

Use Supabase SQL Editor.

### Step 1
Open your Supabase project dashboard.

### Step 2
Open `SQL Editor`.

### Step 3
Open the first migration file from this folder and paste it into SQL Editor:

`supabase/migrations/20260416_01_expand_trees_for_management.sql`

Click `Run`.

### Step 4
Do the same for the second file:

`supabase/migrations/20260416_02_create_irrigation_assets.sql`

Click `Run`.

### Step 5
Do the same for the third file:

`supabase/migrations/20260416_03_expand_work_orders_and_targets.sql`

Click `Run`.

### Step 6
After each one runs, check that there is no error message.

## Important note

This method updates the database, but Supabase does not automatically know about your local migration history when you only use SQL Editor.

That means:

- your database changes will be live
- your migration files will still be useful as your version history in Git
- but the Supabase CLI migration tracking table will not yet be synced automatically

## Better long-term path: Supabase CLI

Once you are ready, use the CLI so your migration files and remote migration history stay aligned.

### Install the CLI

Windows options are documented here:
https://supabase.com/docs/guides/cli/getting-started

### Login

Run:

`supabase login`

A browser window will open. Sign in and copy/paste the access token if prompted.

### Open a terminal in this project folder

Folder:

`C:\Users\BB_ne\OneDrive\Projects\Coding\Pecan Management\Manual Programming\VS Code`

### Link your Supabase project

Run:

`supabase link --project-ref etqenbfxzyhpcpudmlqo`

### Push migrations

If the remote database does not already have these changes, run:

`supabase db push`

## If you already applied them in SQL Editor first

You have two safe choices.

### Choice A: Keep using SQL Editor for now

- Run the SQL files manually in SQL Editor.
- Keep the migration files in this folder and commit them to Git.
- Later, when you are more comfortable, we can align CLI migration history.

### Choice B: Switch to CLI tracking after the SQL Editor run

After applying the SQL manually, do not run `supabase db push` immediately unless the migration history is synced.

Instead, message me and I can help you align the migration history safely with:

- `supabase migration list`
- `supabase migration repair`

That avoids duplicate-change errors.

## What these migrations do

### Trees
Adds:

- `health_status`
- `irrigation_zone`
- `tree_notes`
- `photo_url`

### Irrigation assets
Creates a new table:

- `public.irrigation_assets`

This can store:

- pumps
- headers
- laterals
- valves
- similar orchard irrigation infrastructure

### Work orders
Adds to `work_orders`:

- `title`
- `priority`
- `due_date`
- `work_notes`
- `target_type`

Creates:

- `public.work_order_targets`

This allows one work order to target:

- a tree
- a field
- an irrigation asset

It also backfills existing single-tree work orders into the new target table.
