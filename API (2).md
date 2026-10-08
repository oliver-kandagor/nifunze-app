# Nifunze API

Base URLs

- Preview: `https://project--68eea729-dd72-42e6-a440-546bd30e80e9-dev.lovable.app`
- Production: `https://project--68eea729-dd72-42e6-a440-546bd30e80e9.lovable.app`

All gameplay endpoints live under `/api/public/v1/...` and require the signed-in
user's Supabase access token:

```
Authorization: Bearer <access_token>
Content-Type: application/json
```

Errors return `{ "error": "message" }` with status 400/401/403/404.
CORS is open (`*`) and every route answers `OPTIONS` preflight.

## Authentication (Supabase, direct from Flutter)

Supabase project:

- URL: `https://ffwelfbcuwvzichpgneq.supabase.co`
- Publishable (anon) key: `sb_publishable_EQoAnL4cVCEwTfrb4UJREw_cBlhyOAS`

Use `supabase_flutter`:

```dart
await Supabase.instance.client.auth.signUp(email: e, password: p);
await Supabase.instance.client.auth.signInWithPassword(email: e, password: p);
await Supabase.instance.client.auth.signInWithOAuth(OAuthProvider.google,
    redirectTo: 'com.kanda.nifunze://login-callback');
final token = Supabase.instance.client.auth.currentSession!.accessToken;
```

A `profiles` row (display name, user code, energy 5, streak 0, coins 0) is created
automatically on sign-up.

---

## Profile

### GET /api/public/v1/profile

Syncs energy, marks the user active, returns the profile.

```json
{
  "profile": {
    "user_id": "uuid",
    "display_name": "Learner",
    "avatar_url": null,
    "avatar_id": null,
    "user_code": "A1B2C3D4",
    "current_energy": 4,
    "max_energy": 5,
    "seconds_to_next_energy": 512,
    "day_streak": 3,
    "last_played_date": "2026-09-09",
    "total_coins": 120,
    "total_score": 640
  }
}
```

### PUT /api/public/v1/profile

Body (all optional): `display_name` (1-40), `avatar_id` (string|null),
`avatar_url` (url|null). Returns the same `profile` object.

### Profile picture upload

Bucket `avatars` is private; each user may only write inside a folder named
after their own user id.

```dart
final uid = client.auth.currentUser!.id;
final path = '$uid/avatar.jpg';
await client.storage.from('avatars').upload(path, file,
    fileOptions: const FileOptions(upsert: true));
final signed = await client.storage.from('avatars')
    .createSignedUrl(path, 60 * 60 * 24 * 365);
// persist it
await api.updateProfile(avatarId: path, avatarUrl: signed);
```

Lesson media (bucket `media`) is readable by any signed-in user; get a signed
URL the same way when a task references a storage path.

---

## Content

### GET /api/public/v1/categories

```json
{ "categories": [ { "id":"uuid","slug":"math","name":"Math","description":"...","icon_url":null,"color":"#EC4899","sort_order":0 } ] }
```

### GET /api/public/v1/categories/{categoryId}/levels

```json
{ "levels": [ {
  "id":"uuid","title":"Numbers 1-5","description":null,"difficulty":1,
  "sort_order":0,"coin_reward":10,"xp_reward":20,
  "unlocked":true,"completed":false,"best_score":0,"stars":0,"attempts":0
} ] }
```

The first level is always unlocked; the next unlocks when the previous is completed.

### GET /api/public/v1/levels/{levelId}/content

```json
{
  "id":"uuid","category_id":"uuid","title":"Numbers 1-5","description":null,
  "difficulty":1,"coin_reward":10,"xp_reward":20,
  "sequence":[ {
    "id":"uuid","sort_order":0,"task_type":"multiple_choice",
    "prompt":"Which one is 3?",
    "media_urls":[],
    "interactive_data":{"options":["1","3","5"]},
    "correct_answer":{"value":"3"}
  } ]
}
```

`task_type` is one of `display_letter`, `trace`, `multiple_choice`,
`image_choice`, `audio_match`, `math_visual`, `interactive_drag`,
`drag_and_drop`. `interactive_data` and `correct_answer` are free-form JSON so
new mini-games need no API change.

---

## Energy, coins, progress

### POST /api/public/v1/energy/sync
No body. Returns `{ "profile": ... }` with energy refilled (1 unit / 15 min, max 5).

### POST /api/public/v1/mistake
No body. Deducts one energy. Returns `{ "profile": ..., "locked": true|false }`.
`locked` is true when energy reached 0.

### POST /api/public/v1/spend-coins
```json
{ "amount": 50, "reason": "refill_energy" }
```
`reason`: `refill_energy` | `avatar` | `other`. `refill_energy` restores energy to
max. Fails with `Not enough coins`. Returns `{ "profile": ... }`.

### POST /api/public/v1/progress
```json
{ "level_id": "uuid", "score": 85, "stars": 2, "completed": true }
```
Server computes rewards (`coin_reward * difficulty * score/100`,
`xp_reward * score/100`), updates streak (continues if last play was yesterday,
otherwise resets to 1), stores best score / stars / attempts.

```json
{ "profile": {...}, "coins_earned": 8, "xp_earned": 17, "stars": 2,
  "chest": "silver", "next_level_id": "uuid|null" }
```
`chest`: gold (>=90), silver (>=70), bronze otherwise.

---

## Social

### GET /api/public/v1/leaderboard?type=global|friends&limit=100
```json
{ "type":"global","entries":[{"rank":1,"user_id":"uuid","display_name":"Ada",
  "avatar_url":null,"total_score":900,"day_streak":5,"total_coins":300,"is_me":false}],
  "me": { ... } }
```

### GET /api/public/v1/friends
```json
{ "friends":[{"friendship_id":"uuid","status":"accepted","direction":"outgoing",
   "friend":{"id":"uuid","display_name":"Ada","avatar_url":null,"total_score":900,
             "total_coins":300,"day_streak":5,"user_code":"A1B2C3D4"}}],
  "incoming_requests":[], "outgoing_requests":[] }
```

### POST /api/public/v1/friends
`{ "user_code": "A1B2C3D4" }` or `{ "friend_id": "uuid" }` (QR codes should encode
the user code). If that person already invited you, the request is accepted
immediately. Returns `{ "friendship": { "id": "...", "status": "pending|accepted" } }`.

### PUT /api/public/v1/friends/{friendshipId}
`{ "action": "accept" | "decline" | "block" }` — only the recipient may respond.
`decline` deletes the request.

### DELETE /api/public/v1/friends/{friendshipId}
Removes the friendship. Returns `{ "ok": true }`.
