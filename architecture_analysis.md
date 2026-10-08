# Nifunze Architecture Analysis
Based on the `Kids Game.pdf` reference.

## 1. What should be STATIC (Bundled in the Flutter App)
These elements do not change between users or sessions and should be hardcoded into the app bundle to ensure fast load times and a responsive UI.

- **UI Layouts & Theming:** All screen layouts, colors, fonts, shapes, button styles, and animations (e.g., the confetti animation on the "Flawless" screen).
- **Navigation Structure:** The bottom navigation bar, app bar logic, and the structural skeletons of screens.
- **Core Icons & Assets:** The back button icon, the heart/energy icon, the streak fire icon, coin icons, and standard UI vectors.
- **Static Text Strings:** Base labels like "Already Have an Account?", "Log Out", "Check", "Continue", "Find Your Friend", "Privacy Policy", etc. (Unless localization/translation is fetched remotely, which is recommended to be bundled).
- **Widget Components:** The actual Dart code that *knows* how to render a multiple-choice grid, a drag-and-drop zone, or a tracing canvas.

## 2. What should be DYNAMIC (Local State)
This is temporary data held in memory while the user interacts with the app, before being sent to the server.

- **Form Inputs:** Passwords, email addresses during Auth.
- **Active Gameplay State:** 
  - Which options the user has tapped (e.g., selecting the "Tiger" button).
  - The current progress bar state *within* a single lesson (e.g., 2/5 questions complete).
  - Tracing path data while the user's finger is on the screen.
- **Timers:** The local countdown timer for the Energy refill (synced against the backend timestamp).

## 3. What should be FETCHED ONLINE (Backend / Database)
To make the app scalable and maintainable without App Store updates, all content, progression, and social data must be fetched from the API.

### A. Meta-Game & User Progression
- **Profile:** User's Name, Username (`@liam`), Join Date, Avatar choice, Follower/Following counts.
- **Currencies & Stats:** 
  - **Energy:** Current count (e.g., 25) and last refill timestamp.
  - **Coins:** Current balance (e.g., 8000).
  - **Streak:** Current day count (e.g., 64) and the calendar history array.
  - **XP / Score:** Total XP (e.g., 42302) and League Rank.
- **Missions:** Daily and Monthly mission goals, descriptions, and user progress against them.
- **Unlocks:** Which levels/sections are locked vs. unlocked (e.g., Addition is locked, Counting is unlocked).

### B. Social & Leaderboard
- **Leaderboards:** The "Sapphire League" list (names, avatars, XP, ranking order).
- **Friends List:** Real names, usernames, and avatars of contacts.
- **QR Codes:** The payload string generated for sharing a profile.

### C. Learning Content (The Core Engine)
Every interactive element inside a lesson is defined by JSON from the backend. 
- **The Question Text:** e.g., "How many candies are on this screen?", "Tap The Right Sign", "Connect animal to name".
- **The Options/Assets:** 
  - URLs to images (e.g., the Lion SVG, the 5 Candies SVG).
  - URLs to audio files (e.g., the sound for the letter "C").
  - Array of choices (e.g., `[6, 7, 8, 9]`, `[Tiger, Cheetah, Lion, Elephant]`).
  - Tracing coordinates for letters (e.g., the dot map for tracing 'B').
  - Word builder logic (e.g., `target_word: "LION"`, `provided_letters: ["L", "I", "O", "A", "B", "N", ...]`).
  - Word Search grid matrix and the hidden words array.
- **The Correct Answer:** The strict value the backend validates against to award XP and allow progression.
