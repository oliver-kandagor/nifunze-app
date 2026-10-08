# Nifunze Business Logic & Data-Driven Architecture Plan

## 1. Overview
This document outlines the business logic for the entire Nifunze app, covering UI widget connections, state management transitions, meta-game mechanics (Energy, Streak, Coins, Profile, Leaderboard), and rendering all forms of learning dynamically from a backend data source. The app is completely data-driven.

## 2. Global State & Meta-Game Mechanics (Business Logic)

### A. Life / Energy System
- **How it looks:** A heart/energy icon in the header showing a count (e.g., 5/5).
- **Business Logic (`EnergyBloc`):** 
  - Every mistake in a quiz deducts 1 Energy.
  - If Energy reaches 0, the user is locked out of gameplay.
  - **Refill Mechanic:** Energy replenishes over time (e.g., 1 Energy every 15 minutes). The app compares the current time with the `last_energy_update` timestamp from the backend to calculate regenerated energy locally, then syncs. Users might also refill energy using Coins.

### B. Streak System
- **How it looks:** A fire icon with a number representing consecutive days played.
- **Business Logic (`StreakBloc`):**
  - Upon completing the first lesson of the local day, a `streak_increment` event is dispatched.
  - The backend checks `last_played_date`. If it was yesterday, `day_streak` += 1. If it was earlier than yesterday, `day_streak` resets to 1.
  - The UI highlights the days of the week they've maintained the streak.

### C. Coins & Rewards System
- **How it looks:** A coin counter, and post-game reward screens (Bronze, Silver, Gold chests).
- **Business Logic (`RewardBloc`):**
  - Upon passing a level, the user is awarded Coins and a Chest based on their score and difficulty.
  - Coins are added to the user's global balance and can be spent in the Profile/Settings (e.g., unlocking new avatars or refilling energy).

### D. Profile & Social (Avatars, Friends, QR Code)
- **How it looks:** A profile screen showing Name, Profile Picture (Avatar), Stats, and a Follow/Friends list. A QR scanner screen for adding friends.
- **Business Logic (`ProfileBloc` & `SocialBloc`):**
  - **Avatars:** User selects an avatar image ID (e.g., `avatar_fox`) which is stored in the database. The UI maps this ID to local/remote assets.
  - **Friends & QR:** Each user has a unique ID/QR Code. Scanning the QR code dispatches an `add_friend(targetUserId)` event.
  - **Friend Details:** Tapping a friend shows their stats (Coins, Streak, Score) compared to the current user.

### E. Leaderboard
- **How it looks:** A ranked list of players (Global or Friends-only) ordered by score.
- **Business Logic (`LeaderboardBloc`):**
  - Fetches top users from the backend, paginated.
  - Highlights the current user's rank in a sticky bottom banner if they aren't in the top 10.

## 3. Navigation & Button Routing Logic
- **Main Navigation (Home/Categories):** Buttons dispatch events to load the `SubjectData`. The Router pushes to a "Level Map".
- **Top Bar UI:** The Energy, Streak, and Coin counters in the app bar listen to their respective BLoCs and update automatically. Clicking Profile pushes the Profile screen.
- **Level/Node Selection:** Tapping a node on the map fetches the module's JSON payload and routes to a dynamic `QuizHostScreen`.
- **In-Game Navigation:**
  - **Submit/Check:** Triggers `ValidationBloc`. Correct -> Adds score. Wrong -> Deducts Energy.
  - **End of Quiz:** Pushes to the Reward Screen, dispatches progress to the backend, calculates new streak, and updates the Coin balance.

## 4. Data-Driven Learning Objects (The Schema)

### Generic Module Schema
```json
{
  "id": "module_123",
  "category": "alphabet",
  "title": "Letter of the Day",
  "difficulty": 1,
  "sequence": [ /* Array of interactive screens/questions */ ]
}
```

### Forms of Learning & Implementation
1. **Alphabet (Display, Trace, Match):** `type: "display_letter"`, `type: "trace"`, `type: "multiple_choice"`.
2. **Math (Counting, Interactive Drag, Equations):** `type: "math_visual"`, `type: "interactive_drag"`.
3. **Animals (Image Choice, Audio Match):** `type: "image_choice"`, `type: "audio_match"`.
4. **Knowledge (Drag and Drop):** `type: "drag_and_drop"`.
*(All UI rendered strictly via mapping the `type` to specific Flutter widgets using the `interactive_data` from the internet).*
