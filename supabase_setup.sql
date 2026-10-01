-- Run this in your Supabase SQL Editor (supabase.com → your project → SQL Editor)
-- Creates the two tables CricScore needs

create table if not exists cs_users (
  id uuid primary key default gen_random_uuid(),
  username text unique not null,
  display_name text not null,
  password_hash text not null,
  token text not null,
  created_at timestamptz default now()
);

create table if not exists cs_matches (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references cs_users(id) on delete cascade,
  username text not null,
  match_data jsonb not null,
  played_at timestamptz default now()
);

-- Indexes for fast lookups
create index if not exists idx_cs_users_username on cs_users(username);
create index if not exists idx_cs_matches_username on cs_matches(username);
create index if not exists idx_cs_matches_played_at on cs_matches(played_at desc);

-- Disable Row Level Security (we handle auth in our API)
alter table cs_users disable row level security;
alter table cs_matches disable row level security;
