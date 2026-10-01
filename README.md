# 🏏 CricScore Live — Deployment Guide

## Deploy to Vercel in 5 minutes

### Step 1 — Set up Supabase (free database)
1. Go to **supabase.com** → Sign up → New Project
2. Give it a name like `cricscore`, pick a region close to India (Singapore)
3. Wait ~2 minutes for it to provision
4. Go to **SQL Editor** → paste the contents of `supabase_setup.sql` → click **Run**
5. Go to **Settings → API** → copy:
   - **Project URL** (looks like `https://abcdef.supabase.co`)
   - **anon/public key** (long JWT string)

### Step 2 — Deploy to Vercel
1. Push this folder to a GitHub repo
2. Go to **vercel.com** → New Project → Import your repo
3. In **Environment Variables**, add:
   - `SUPABASE_URL` = your Project URL from step 1
   - `SUPABASE_KEY` = your anon key from step 1
4. Click **Deploy** — done!

### Step 3 — Update your Service Worker (optional)
In `sw.js`, change the cache name to `cricscore-v2` so users get the new version.

---

## Features Added

| Feature | Details |
|---|---|
| 🔐 Login / Register | Username + password auth, syncs across devices |
| 📜 Full Match History | Last 10 matches with full batting + bowling scorecard |
| ☁ Cloud Sync | Matches auto-saved to cloud when logged in |
| 📄 PDF Download | Full styled scorecard as a PDF |
| 📲 WhatsApp Share | One-tap share scorecard as formatted text |
| ⚠ Back/Reload Warning | Warns before leaving a live match |
| 🎉 Milestone Alerts | Animated popup for 25, 50, 100, 150, 200 runs |
| 📳 Haptic Feedback | Vibration on every scoring button tap |
| 💡 Wake Lock | Screen stays on during live scoring |

---

## File Structure
```
/
├── index.html          ← Main app (all features)
├── sw.js               ← Service worker (offline)
├── manifest.json       ← PWA manifest
├── icon.png            ← App icon
├── vercel.json         ← Vercel routing config
├── api/
│   └── auth.js         ← Serverless API (auth + history)
└── supabase_setup.sql  ← Run once in Supabase SQL editor
```

## Without Supabase (local-only mode)
The app works fully without any backend setup. Users can:
- Score matches normally
- View local history
- Download PDFs and share on WhatsApp
They just won't get cross-device sync — the login button still shows but returns a helpful error.
