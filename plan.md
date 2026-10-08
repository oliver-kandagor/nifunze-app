# Nifunze — Build Plan

## 1. Status Snapshot
Last updated: 2026-09-08
Current phase: Project Setup & Foundation
Screens completed: 3 / 46

## 2. Screen Checklist
- [x] Starting Page
- [x] Sign In
- [x] Sign Up
- [ ] Forgot Password
- [ ] Getting Started
- [x] Home
- [x] Home / Streak
- [x] Home / Energy
- [x] Day Streak
- [x] Reward
- [x] Leaderboard
- [ ] Complete
- [x] Profile
- [x] Profile / Settings
- [x] Profile / Follow Friends
- [x] Profile / Follow Friends / Contact
- [x] Friend Detail
- [x] Friend Detail QR
- [x] Friend Detail / Reward Detail
- [ ] Math (home)
- [ ] Math / Counting / Default
- [ ] Math / Counting / Select Answer
- [ ] Math / Addition
- [ ] Math / Subtraction
- [ ] Math / Fill the Gap
- [ ] Math / Greater or Less
- [ ] Math / Time
- [ ] Math / Money
- [ ] Alphabet (home)
- [ ] Alphabet / Letter of the Day (+ Correct/Wrong Spelling)
- [ ] Alphabet / Trace the Letter
- [ ] Alphabet / What Letter is This
- [ ] Alphabet / Alphabet Map
- [ ] Alphabet / Listen & Match
- [ ] Alphabet / Match the Letter (+ Wrong Answer)
- [ ] Alphabet / Find the Vowel
- [x] Home / Animals
- [ ] Animals / Animal Kingdom
- [ ] Animals / Match it (+ Wrong)
- [ ] Animals / Find the Sounds
- [ ] Animals / Where do I Live
- [ ] Animals / Guess the Animal
- [x] Home / Knowledge
- [ ] Knowledge / My Body (+ Wrong/True)
- [ ] Knowledge / Opposite
- [ ] Knowledge / World Builder (+ Text Complete variants)

## 3. Design System Log
Record actual extracted values as we go:
- **Colors**:
  - `primaryBlue`: `#5BA4FF`
  - `background`: `#FFFFFF`
  - `textHeading`: `#111111`
  - `textBody`: `#888888`
  - `borderGrey`: `#E0E0E0`
  - `cardGrey`: `#F9F9F9`
- **Typography**: Google Fonts `Poppins` (Bold for headings, Regular for body)
- **Spacing/Radius**: 12px for buttons and inputs, padding 24px horizontal.
- **Shared Components Built**:
  - `PrimaryButton` (lib/features/auth/presentation/widgets/primary_button.dart)
  - `SecondaryButton` (lib/features/auth/presentation/widgets/secondary_button.dart)
  - `CustomBackButton` (lib/features/auth/presentation/widgets/custom_back_button.dart)
  - `SocialAuthButton` (lib/features/auth/presentation/widgets/social_auth_button.dart)
  - `CustomTextField` (lib/features/auth/presentation/widgets/custom_text_field.dart)

## 4. Data Model Log
Running record of the real Firestore schema as it evolves — collections, fields, security rules decisions, and Cloud Functions created.

## 5. Decisions Log
- **State Management**: BLoC (Overriding Riverpod mentioned in the Master Prompt based on user's initial instructions).
- **Architecture**: Clean Architecture.
- **Backend**: Firebase (Auth, Firestore, Storage, Functions).

## 6. Open Questions
- **Figma Screens**: Waiting for the first screenshot/export to extract exact typography, colors, and the onboarding flow.

## 7. Next Up
- Foundation setup (Design system basics, Firebase init, BLoC setup) alongside the **Starting Page** (First screenshot).
