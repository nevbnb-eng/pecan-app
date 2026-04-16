# Supabase Database Versioning

This project now has a basic Supabase migration structure.

## Folder layout

- `supabase/migrations/`: ordered SQL migration files
- `supabase/seed/`: optional seed data for non-production environments

## Recommended workflow

1. Make schema changes in SQL migration files whenever possible.
2. Keep each change small and descriptive.
3. Commit migration files to Git with your app code.
4. Apply migrations to a test/staging database first.
5. Apply the same migrations to production only after testing.

## Can this be done in SQL Editor?

Yes, but with an important warning:

- The Supabase SQL Editor can run SQL directly against your remote database.
- Running SQL in the editor by itself is not version control.
- If you use SQL Editor, you should immediately capture the same change in a migration file.

Best practice:

- Use migration files as the source of truth.
- Use SQL Editor for quick experiments, one-off inspection, or emergency fixes.
- If you change schema in SQL Editor first, pull that change back into a migration file.

## Two good ways to work

### Option A: Best practice with Supabase CLI

1. Install the Supabase CLI.
2. In this project folder, initialize or use the existing `supabase/` folder.
3. Create a new migration:
   `supabase migration new add_tree_health_status`
4. Put your SQL into the new migration file.
5. Test locally or on a dev branch.
6. Push migrations to the linked project:
   `supabase db push`

Useful commands:

- `supabase link --project-ref <your-project-ref>`
- `supabase migration new <name>`
- `supabase db push`
- `supabase db pull`
- `supabase migration list`
- `supabase migration repair`

## If you already changed production in SQL Editor

Create a migration that captures the remote schema state:

1. Link your project:
   `supabase link --project-ref <your-project-ref>`
2. Pull remote schema changes into a migration file:
   `supabase db pull`

Notes:

- According to Supabase docs, `supabase db pull` creates a new migration under `supabase/migrations`.
- It requires a linked project.
- It may require Docker to diff the remote schema.

### Option B: SQL Editor + disciplined manual migrations

If you prefer the dashboard SQL Editor:

1. Run your SQL in SQL Editor.
2. Copy the exact SQL into a new file under `supabase/migrations/` with a timestamp prefix.
3. Commit that migration file to Git.

This works, but it is easier to drift out of sync than the CLI-first workflow.

## Suggested production-safe process

1. Write migration locally.
2. Review the SQL carefully.
3. Apply it to a dev or branch environment first.
4. Test the app.
5. Apply to production.
6. Commit the migration file and any app changes together.

## Rollback mindset

Supabase migrations are usually forward-only.
Instead of relying on a magical undo button, create a new migration that reverses the earlier change if needed.
For serious recovery, use Supabase backups or point-in-time recovery.

## Branching

Supabase Branches are useful for testing schema and config changes safely before production.
Important note from the docs: new branches do not start with production data by default.

## Good naming examples

- `20260416_add_tree_health_status.sql`
- `20260416_add_irrigation_assets.sql`
- `20260416_expand_work_order_targets.sql`

## Immediate next step for this orchard project

When you are ready, create migrations for changes like:

- add tree health status
- add irrigation zone
- add tree notes/photo fields
- add irrigation assets table
- add work order target join table
