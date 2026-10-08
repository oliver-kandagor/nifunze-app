# Prompt for Lovable AI (Backend Generation)

**Context:**
We are building the backend for "Nifunze", a highly interactive, data-driven educational app for kids. The app includes gamified learning modules spanning four main categories: Math, Alphabet, Animals, and Knowledge. The frontend mobile app relies completely on the backend to dictate what content is shown, manage meta-game progression (Energy, Streaks, Coins), and handle social features (Leaderboards, Profiles, Friends).

**Your Task:**
Generate a complete backend architecture, API endpoints, and database schema (using Firebase/Firestore, Supabase, or PostgreSQL) to serve this educational content and manage all meta-game systems. 

### 1. Database Schema Requirements

Please design collections/tables for the following comprehensive systems:

1. **Users (Profile, Meta-game & Progression):** 
   - `user_id` (PK)
   - `display_name`, `avatar_id` (string representing their chosen profile pic)
   - `current_energy` (int, max 5), `last_energy_update` (timestamp for regeneration logic)
   - `day_streak` (int), `last_played_date` (timestamp for streak logic)
   - `total_coins` (int - earned from chests/rewards)
   - `total_score` (int - for leaderboard ranking)
   - `unlocked_levels` (array of level IDs)

2. **Social (Friends & Leaderboard):**
   - `friends` mapping/table: `user_id`, `friend_id` (supports adding friends via QR code).

3. **Categories & Levels (The Map):** 
   - Defines the map structure (e.g., Math world, Alphabet world). A category has many levels.

4. **Learning Modules (The Data-Driven Content):**
   - `id`, `level_id`, `category`, `title`, `difficulty`
   - `sequence`: An array of interactive tasks. Each task must have:
     - `task_type`: String (e.g., "multiple_choice", "drag_and_drop", "trace", "audio_match").
     - `media_urls`: Array of strings (audio, images, vectors).
     - `interactive_data`: Flexible JSON object detailing options and coordinates.
     - `correct_answer`: The exact condition the frontend must match.

### 2. API Endpoints Needed (Core App Logic)

**A. User Meta-game & Social (GET)**
- `GET /api/users/{userId}/profile` -> Returns profile, avatar, energy, streak, coins, and score.
- `GET /api/users/{userId}/friends` -> Returns list of friends with their stats (for Friend Detail UI).
- `GET /api/leaderboard?type={global|friends}&limit=100` -> Returns ranked list of users by `total_score`.

**B. Social Actions & Shop (POST/PUT)**
- `PUT /api/users/{userId}/profile` -> Updates `display_name` or `avatar_id`.
- `POST /api/users/{userId}/friends` -> Adds a friend (Triggered when frontend scans a friend's QR code containing their user ID).
- `POST /api/users/{userId}/spend_coins` -> Deducts coins to refill energy or buy a new avatar.

**C. Gameplay & Content (GET)**
- `GET /api/categories/{categoryId}/levels` -> Returns the map of levels and user's unlock status.
- `GET /api/levels/{levelId}/content` -> **CRITICAL ENDPOINT.** Returns the full, rich JSON sequence of interactive tasks. The frontend renders UI exclusively from this.

**D. Gameplay Progression & Validation (POST/PUT)**
- `POST /api/users/{userId}/mistake` -> Deducts 1 from `current_energy`. Records `last_energy_update` if energy drops below max.
- `POST /api/users/{userId}/energy/sync` -> Calculates and replenishes energy based on time passed since `last_energy_update`.
- `POST /api/users/{userId}/progress` -> Receives result of a completed level.
  - Payload: `{ "level_id": "123", "score": 95, "coins_earned": 20 }`
  - Action (Backend Logic): 
    1. Updates `total_score` and `total_coins`.
    2. Streak Logic: Checks `last_played_date`. If yesterday, `day_streak`++. If older, resets `day_streak` to 1. Sets `last_played_date` to today.
    3. Unlocks the next sequential level.
    4. Returns the updated User state (new streak, coin balance, score).

### 3. Technical Constraints for the Backend
- Responses must be strictly typed JSON.
- The `interactive_data` field for levels must use JSONB (if SQL) or flexible Maps (if NoSQL) to handle diverse frontend mini-games without altering backend schemas.
- Energy regeneration logic should be verifiable on the backend to prevent frontend time-tampering.
- Leaderboard queries must be indexed on `total_score` descending for high performance.
