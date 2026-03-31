<div align="center">

<br/>

<img src="https://capsule-render.vercel.app/api?type=waving&color=0:6366f1,50:8b5cf6,100:a78bfa&height=200&section=header&text=TrackMe&fontSize=80&fontColor=ffffff&fontAlignY=38&desc=Your%20intelligent%20fitness%20companion&descAlignY=60&descSize=20&descColor=c4b5fd&animation=fadeIn" width="100%"/>

<br/>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.19+-02569B?style=for-the-badge&logo=flutter&logoColor=white" />
  &nbsp;
  <img src="https://img.shields.io/badge/Dart-3.3+-0175C2?style=for-the-badge&logo=dart&logoColor=white" />
  &nbsp;
  <img src="https://img.shields.io/badge/Firebase-Enabled-FFCA28?style=for-the-badge&logo=firebase&logoColor=black" />
  &nbsp;
  <img src="https://img.shields.io/badge/License-MIT-6366f1?style=for-the-badge" />
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Platform-iOS%20%7C%20Android-black?style=for-the-badge&logo=apple&logoColor=white" />
  &nbsp;
  <img src="https://img.shields.io/badge/AI%20Powered-GPT%20%7C%20Gemini-10b981?style=for-the-badge&logo=openai&logoColor=white" />
  &nbsp;
  <img src="https://img.shields.io/badge/PRs-Welcome-f472b6?style=for-the-badge" />
</p>

<br/>

<p align="center">
  <b>TrackMe</b> is a premium, production-grade Flutter fitness app built for people serious about their health.<br/>
  Real-time step tracking · AI coaching · Social challenges · Sleep analytics · Guided workouts<br/>
  all in a beautifully crafted UI that feels like it shipped from Apple.
</p>

<br/>

<p align="center">
  <a href="#-features">Features</a> •
  <a href="#-design-system">Design</a> •
  <a href="#-architecture">Architecture</a> •
  <a href="#-tech-stack">Tech Stack</a> •
  <a href="#-getting-started">Getting Started</a> •
  <a href="#-roadmap">Roadmap</a>
</p>

</div>

<br/>

---

<br/>

## 🌟 Features at a Glance

<div align="center">

| 🦶 Step Tracking | 🔔 Smart Notifications | 🏋️ Workouts |
|:---:|:---:|:---:|
| Live animated ring | 10 trigger categories | 50+ exercises |
| Background counting | 100+ unique messages | Drag & drop builder |
| Adaptive daily goals | Non-repeating cycles | Live session mode |

| ⏱️ Timer Suite | 📊 Activity Heatmap | 🤖 AI Features |
|:---:|:---:|:---:|
| Stopwatch + laps | GitHub-style 26wk grid | Workout plan generator |
| HIIT / Tabata / EMOM | Live daily updates | Form checker (ML Kit) |
| Jump rope counter | Streak + completion % | AI coach chat |

| 👥 Social | 😴 Sleep & Health | 🧘 Wellness |
|:---:|:---:|:---:|
| Friend challenges | Sleep score + HRV | Gratitude journal |
| Global leaderboard | Heart rate zones | Guided meditation |
| XP levels + badges | SpO2 + mood tracking | Breathing exercises |

</div>

<br/>

---

<br/>

## ✨ Features

<br/>

### 🦶 Real-Time Step Tracking

- **Live pedometer** with animated step ring built using Flutter `CustomPainter`
- Background tracking — steps are counted even when the app is closed
- Daily / weekly / monthly history with smooth `fl_chart` graphs
- Calorie burn estimation and distance calculation with km/miles toggle
- **Adaptive goals** — auto-adjusts daily target based on 7-day rolling average (max 10% jump)
- **Home screen widget** showing the live step ring via `home_widget` package
- Confetti celebration animation the moment the goal is reached

<br/>

### 🔔 Smart Motivational Notifications

10 intelligent trigger categories — each with 10+ unique, non-generic messages written like a coach and philosopher:

<div align="center">

| # | Category | Trigger Condition |
|---|----------|-------------------|
| 1 | 🌅 Morning | Every day at 6–8 AM |
| 2 | 👟 Steps | At 25%, 50%, 75%, 90%, 100% of daily goal |
| 3 | 🎯 Goal Hit | Immediately on goal completion |
| 4 | 🔥 Streak | Day 3, 7, 14, 21, 30, 60, 100 |
| 5 | 🪑 Inactivity | After 90 min / 2 hr / 3 hr of no movement |
| 6 | 🏋️ Workout | 15 min before scheduled session |
| 7 | 🌙 Night | 9–10 PM if activity rings are not closed |
| 8 | 📅 Weekly | Monday morning + Sunday evening recap |
| 9 | 💧 Hydration | Every 90 min during waking hours |
| 10 | 💡 Wisdom | Random daily quote at user-chosen time |

</div>

> Messages rotate using `SharedPreferences` index tracking — no repeated notifications until the full cycle completes. Zero notification fatigue.

<br/>

### 🏋️ Exercise & Workout Tracker

- Library of **50+ exercises** across cardio, strength, and flexibility categories
- Custom exercise creator with GIF / image support
- **Drag-and-drop** workout session builder
- Superset & circuit builder with per-block rest configuration
- **Live workout mode:**
  - Rep / set counter with voice countdown via `flutter_tts`
  - Auto-starting rest timer between sets
  - Heart rate zone indicator
  - Exercise animation with pose guidance overlay
- **Personal records (PR)** tracking with Lottie badge unlock animations
- Full workout history with performance trend graphs

<br/>

### ⏱️ Timer Suite

| Timer | Features |
|-------|----------|
| ⏱️ Stopwatch | Lap tracking · split times · best/worst lap highlight · animated ring |
| 🔁 Interval Timer | Work/rest configurator · HIIT / Tabata / EMOM / AMRAP presets |
| ⏳ Countdown | Custom duration · visual urgency animation as time runs out |
| 😮‍💨 Rest Timer | Auto-starts between exercise sets in live workout mode |
| 🪢 Jump Rope | Contactless counting via accelerometer + mic detection |

<br/>

### 📊 GitHub-Style Activity Heatmap

```
       Oct    Nov    Dec    Jan    Feb    Mar
Mon  [ ][ ][▓][█][ ][ ][▒][█][▓][ ][ ][█][▓][▒][ ][█]
Tue  [▒][█][▓][ ][▒][█][ ][▓][█][▒][ ][▓][█][ ][▒][█]
Wed  [█][▓][▒][ ][█][▓][▒][ ][█][▓][ ][▒][█][▓][ ][█]
Thu  [ ][▒][█][▓][ ][▒][█][▓][▒][ ][█][▓][▒][ ][█][▓]
Fri  [▓][█][ ][▒][▓][█][ ][▒][▓][█][ ][▒][▓][█][ ][▒]
Sat  [█][▓][▒][ ][█][▓][▒][█][▓][ ][▒][█][▓][▒][ ][█]
Sun  [▒][ ][█][▓][▒][ ][█][▓][▒][█][ ][▓][▒][█][▓][ ]

  ░ = 1–3k steps   ▒ = 3–6k   ▓ = 6–9k   █ = 10k+ (goal hit)
```

- **26 weeks × 7 days** — 182 cells of your fitness story
- Today's cell updates **live** as steps accumulate throughout the day
- Tap any past cell → bottom sheet with that day's full stats
- Long-press today → see live step rate in steps/hour
- Below the grid: **streak row** — current streak 🔥 · total active days · completion rate %
- Data persisted in Hive with `"activity_YYYY-MM-DD"` keys
- Export your full history as CSV with one tap

<br/>

### 🏅 Gamification & XP System

<div align="center">

| Rank | Title | XP Needed | Reward |
|:----:|-------|:---------:|--------|
| 1 | 🥉 Rookie | 0 | Starter badge |
| 2 | 🥈 Contender | 500 | Profile border unlock |
| 3 | 🥇 Athlete | 1,500 | Custom theme unlock |
| 4 | 🏆 Champion | 3,500 | Challenge creation |
| 5 | ⚡ Elite | 7,000 | Analytics dashboard |
| 6 | 👑 Legend | 12,000 | Full profile customization |

</div>

**Earning XP:**
- Goal hit → **+50 XP**
- Workout completed → **+100 XP**
- Streak milestone → **+200 XP**
- Challenge win → **+500 XP**

**Achievement Badges:** First Workout · 7-Day Streak · 10k Steps · Night Owl · Early Bird · Iron Will · Century Club · and more — each unlocks with a Lottie animation and generates a shareable card.

<br/>

### 👥 Social & Challenges

- **Friend challenges** — invite via deep link, compete on steps for 7 / 14 / 30 days
- **Global leaderboard** — filter by city, country, or worldwide (Firebase Realtime)
- **Team challenges** — squads of up to 10 people, pooled step totals vs other teams
- One-tap share of achievement cards to Instagram, WhatsApp, Twitter

<br/>

### 🤖 AI & Smart Features

| Feature | Description |
|---------|-------------|
| 📋 AI Workout Planner | Input goal + days/week + equipment → structured weekly plan |
| 🍱 Calorie Estimator | Photo your meal → vision AI estimates macros and calories |
| 🧍 Form Checker | ML Kit pose detection for squats and push-ups in real time |
| 💤 Recovery Advisor | Personalized suggestions based on workout intensity + HRV + sleep |
| 📈 Adaptive Goals | Auto-adjusts daily step target based on rolling 7-day performance |
| 💬 AI Coach Chat | LLM-powered in-app chat for questions, motivation, and plan changes |

<br/>

### 😴 Health & Biometric Tracking

- **Sleep tracking** with score breakdown — deep / light / REM percentages
- **Heart rate zones** — resting, fat burn, cardio, peak (Apple Health + Google Fit)
- **SpO2 monitor** integration via the `health` package
- **Menstrual cycle tracker** with symptom and energy level logging
- **Posture reminder** — detects slouching via phone tilt after 20 continuous minutes
- **Body metrics log** — weight, waist, chest, arms, hips with beautiful trend charts
- **Mood tracking** — 5-emoji scale after each workout, correlated with activity frequency
- **Stress score** — HRV-based gauge showing low / moderate / high, with 30-day trend

<br/>

### 🧘 Mindset & Wellness

- **Daily gratitude journal** — 3 nightly prompts, weekly reflections, fully searchable history
- **Guided meditation player** — 10 audio sessions with 5-minute focused breathwork mode
- **Breathing exercises** — box breathing, 4-7-8, Wim Hof with animated visual guide
- **Focus mode** — DND wrapper during active workouts, auto-disables on session end
- **Vision board** — goal images + personal affirmations displayed on app open
- **Weekly mental health check-in** — 5-question survey with long-term trend graph

<br/>

### 🏃 Movement Tracking

- **Running pace tracker** — GPS route map, live pace display, per-km splits, post-run elevation chart
- **Cycling route mapper** — GPX file import/export, full route history
- **Yoga & guided stretching** — 20+ sessions with illustrated pose cards and hold timers
- **Jump rope counter** — contactless detection via accelerometer and microphone

<br/>

### ⚙️ Platform & Utility

| Feature | Details |
|---------|---------|
| 🍎 Apple Watch | Live step glance · start/stop workout · heart rate |
| ⌚ WearOS | Equivalent core glance features |
| 🗣️ Siri Shortcuts | "Hey Siri, start my workout in TrackMe" |
| 🤖 Google Assistant | Equivalent shortcut support |
| 📳 NFC Check-In | Tap gym tag → auto-start workout + log visit |
| 📷 Barcode Scanner | Scan supplements → auto-fill macros from Open Food Facts |
| 📡 Offline Mode | Full local functionality + background sync on reconnect |
| 🎙️ Voice Commands | "Next exercise" · "Skip rest" · "How many reps left" |

<br/>

---

<br/>

## 🎨 Design System

> TrackMe is built to feel like a top-tier App Store featured app. Every pixel is intentional — designed like it came out of a senior product team at Apple or Nike.

<br/>

### 🌈 Theme Engine — 6 Premium Palettes

<div align="center">

| Theme | Background | Accent | Feel |
|-------|-----------|--------|------|
| 🌑 **Midnight** | `#0f0f14` | `#6366f1` | Dark navy + electric indigo |
| 🔥 **Ember** | `#1a0a00` | `#fb923c` | Deep dark + burning orange |
| 🌿 **Forest** | `#0a1a0f` | `#4ade80` | Midnight green + fresh mint |
| 🧊 **Arctic** | `#f8fafc` | `#38bdf8` | Pure white + crystalline blue |
| 🌸 **Rose Gold** | `#1a1015` | `#f43f5e` | Warm neutrals + blush rose |
| 🟣 **Void** | `#000000` | `#a78bfa` | True AMOLED black + neon violet |

</div>

All themes switch with a **300ms animated transition** and respect system dark/light mode automatically.

<br/>

### 🔤 Typography

| Role | Font | Weights |
|------|------|---------|
| Display / Hero numbers | Clash Display · Syne | 700 · 800 |
| UI Body | Plus Jakarta Sans | 300 · 500 · 700 |

<br/>

### 📐 Spacing & Radius

```
Base grid: 4px
Scale: 4 · 8 · 12 · 16 · 20 · 24 · 32 · 40 · 48 · 64

Cards:        20px radius
Buttons:      16px radius · 56px height · full-width gradient
Chips/Tags:   100px radius (fully rounded pill)
Bottom sheet: 28px top radius
```

<br/>

### ✨ Animations Required

- ✅ Hero transitions between all screens
- ✅ Staggered list item reveals with configurable delay
- ✅ Confetti burst on daily goal completion
- ✅ Lottie animations for empty states, celebrations, badge unlocks
- ✅ Spring physics on all interactive elements
- ✅ Shimmer loading skeletons throughout
- ✅ Count-up number animation on all stat screens
- ✅ Blur backdrop on scroll for app bars

<br/>

---

<br/>

## 🧱 Architecture

TrackMe follows **Clean Architecture** with strict separation between UI, domain, and data layers.

```
lib/
├── core/
│   ├── theme/              ← Theme engine · 6 palettes · color tokens · typography
│   ├── router/             ← go_router config + custom page transitions
│   ├── utils/              ← Formatters · validators · Dart extensions
│   └── constants/          ← Exercise data · notification copy · app-wide constants
│
├── features/
│   ├── onboarding/         ← Animated onboarding + permission request flows
│   ├── dashboard/          ← Home screen + heatmap + floating pill nav
│   ├── steps/              ← Real-time step tracker screen
│   ├── workout/            ← Library + builder + live session + AI plan generator
│   ├── timer/              ← Stopwatch + interval + countdown + jump rope
│   ├── sleep/              ← Sleep tracking + score breakdown + HRV
│   ├── nutrition/          ← Food diary + barcode scanner + AI meal estimator
│   ├── social/             ← Friends + challenges + leaderboard + XP engine
│   ├── ai_coach/           ← LLM chat interface + workout plan generator
│   ├── wellness/           ← Journal + meditation + mood tracker + vision board
│   ├── profile/            ← Stats overview + badge collection + achievements
│   └── settings/           ← All settings + theme picker + notification config
│
├── shared/
│   ├── widgets/            ← Reusable UI components (rings, cards, buttons)
│   ├── models/             ← Data models (Hive + Freezed generated)
│   └── services/           ← Step · notification · health · AI · storage services
│
└── main.dart
```

<br/>

### 🔄 State Flow

```
┌─────────────────────────────────────────────┐
│              UI — Flutter Widgets            │
└───────────────────┬─────────────────────────┘
                    │  watch / read
┌───────────────────▼─────────────────────────┐
│      Presentation — Riverpod Providers       │
│         AsyncNotifier / StateNotifier        │
└───────────────────┬─────────────────────────┘
                    │  execute use cases
┌───────────────────▼─────────────────────────┐
│         Domain — Use Cases (pure Dart)       │
└───────────────────┬─────────────────────────┘
                    │  implement interfaces
┌───────────────────▼─────────────────────────┐
│     Data — Repositories + Data Sources       │
│   Hive · Isar · Firestore · Health · REST    │
└─────────────────────────────────────────────┘
```

<br/>

---

<br/>

## 📦 Tech Stack

### Core Framework

| Package | Version | Purpose |
|---------|:-------:|---------|
| `flutter_riverpod` | ^2.5 | Reactive state management |
| `go_router` | ^13.0 | Navigation + deep linking |
| `hive` + `isar` | latest | Local database |
| `shared_preferences` | ^2.2 | Lightweight key-value settings |
| `freezed` + `json_serializable` | latest | Immutable models + codegen |

### Health & Sensors

| Package | Version | Purpose |
|---------|:-------:|---------|
| `pedometer` | ^4.0 | Real-time step counting |
| `health` | ^10.0 | Apple Health + Google Fit bridge |
| `geolocator` | ^11.0 | GPS for running and cycling |
| `google_ml_kit` | ^0.16 | Pose detection for AI form checker |
| `sensors_plus` | ^4.0 | Accelerometer — jump rope + posture |

### UI & Animation

| Package | Version | Purpose |
|---------|:-------:|---------|
| `fl_chart` | ^0.68 | Charts, activity graphs, trend lines |
| `lottie` | ^3.0 | Celebration + badge unlock animations |
| `flutter_animate` | ^4.5 | Micro-interactions + staggered reveals |
| `shimmer` | ^3.0 | Loading skeleton screens |
| `flutter_svg` | ^2.0 | SVG asset rendering |
| `confetti` | ^0.7 | Goal completion confetti burst |

### Platform & Backend

| Package | Version | Purpose |
|---------|:-------:|---------|
| `firebase_core` + `cloud_firestore` | ^2.27 | Social features + live leaderboard |
| `firebase_auth` | ^4.17 | User authentication |
| `flutter_local_notifications` | ^17.0 | Smart push notifications |
| `flutter_tts` | ^4.0 | Voice countdown in live workouts |
| `speech_to_text` | ^6.6 | Voice commands during workout |
| `mobile_scanner` | ^5.0 | Supplement barcode scanning |
| `nfc_manager` | ^3.3 | NFC gym check-in |
| `home_widget` | ^0.5 | Home screen live step ring widget |
| `watch_connectivity` | ^2.0 | Apple Watch + WearOS bridge |
| `google_maps_flutter` | ^2.5 | Running and cycling route maps |
| `permission_handler` | ^11.3 | Runtime permission management |

<br/>

---

<br/>

## 🚀 Getting Started

### Prerequisites

```bash
flutter --version      # Must be 3.19+
dart --version         # Must be 3.3+
npm install -g firebase-tools
flutter doctor -v      # All green checkmarks required
```

### 1. Clone & Install

```bash
git clone https://github.com/yourusername/trackme.git
cd trackme
flutter pub get
```

### 2. Generate Code

```bash
# Freezed models + Hive type adapters
dart run build_runner build --delete-conflicting-outputs
```

### 3. Configure Firebase

```bash
firebase login
flutterfire configure
```

### 4. Set Environment Variables

```bash
cp .env.example .env
```

Edit `.env`:

```env
# AI Features (OpenAI or Gemini)
AI_API_KEY=sk-your-key-here
AI_BASE_URL=https://api.openai.com/v1

# Google Maps (for running/cycling)
GOOGLE_MAPS_API_KEY=your-maps-key

# Nutrition API
OPEN_FOOD_FACTS_BASE_URL=https://world.openfoodfacts.org

# Firebase (auto-filled by flutterfire configure)
FIREBASE_PROJECT_ID=your-project-id
```

### 5. Run the App

```bash
flutter run                              # Debug mode
flutter run --release                    # Release mode

# Platform-specific builds
flutter build apk --release              # Android APK
flutter build appbundle --release        # Android App Bundle (Play Store)
flutter build ipa --release              # iOS (requires Xcode)
```

<br/>

### Running Tests

```bash
# All unit tests
flutter test

# Widget tests only
flutter test test/widget/

# Integration tests (requires connected device)
flutter test integration_test/

# Generate coverage report
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

<br/>

---

<br/>

## 📋 Roadmap

### ✅ Shipped

- [x] Real-time step tracking with live animated ring
- [x] 10-category motivational notification system (100+ messages)
- [x] 50+ exercise library with drag-and-drop workout builder
- [x] Full timer suite — stopwatch, interval, countdown, jump rope
- [x] GitHub-style 26-week activity heatmap with live updates
- [x] Floating pill navigation bar with blur backdrop
- [x] 6-theme engine with animated transitions
- [x] XP leveling system with achievement badges
- [x] Social challenges + global leaderboard (Firebase)
- [x] Sleep tracking with score and HRV analytics
- [x] AI workout plan generator
- [x] AI form checker via ML Kit pose detection
- [x] Supplement barcode scanner (Open Food Facts)
- [x] NFC gym check-in with auto workout start
- [x] Apple Watch + WearOS companion apps
- [x] Voice commands during live workouts
- [x] Full offline mode with background sync

### 🔜 Coming Soon

- [ ] Flutter Web companion dashboard
- [ ] Wearable-only minimal mode (watch without phone)
- [ ] Nutrition macro logging via voice input
- [ ] Community feed + public user profiles
- [ ] Human coach marketplace (book certified coaches)
- [ ] AR workout guidance (ARKit / ARCore overlay)
- [ ] Spotify + Apple Music workout playlist sync

<br/>

---

<br/>

## 🤝 Contributing

All contributions are warmly welcome. Please read [CONTRIBUTING.md](CONTRIBUTING.md) first.

```bash
# 1. Fork the repo on GitHub

# 2. Create a feature branch
git checkout -b feature/your-feature-name

# 3. Make changes and write tests

# 4. Commit with conventional commits
git commit -m "feat: add your feature description"
# Prefixes: feat | fix | docs | style | refactor | test | chore

# 5. Push and open a Pull Request
git push origin feature/your-feature-name
```

Please follow the [Conventional Commits](https://www.conventionalcommits.org/) specification.

<br/>

---

<br/>

## 📄 License

```
MIT License — Copyright (c) 2026 TrackMe

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
IN THE SOFTWARE.
```

<br/>

---

<br/>

## 🙏 Acknowledgements

- [Flutter](https://flutter.dev) — the world's best cross-platform framework
- [Firebase](https://firebase.google.com) — scalable backend infrastructure
- [Riverpod](https://riverpod.dev) — elegant reactive state management
- [fl_chart](https://pub.dev/packages/fl_chart) — beautiful Flutter chart library
- [Lottie by Airbnb](https://airbnb.io/lottie/) — bringing animations to life
- [Open Food Facts](https://world.openfoodfacts.org) — free open food database
- The entire Flutter open-source community 💙

<br/>

---

<br/>

<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=0:6366f1,50:8b5cf6,100:a78bfa&height=120&section=footer&animation=fadeIn" width="100%"/>

<br/>

**Built with 💜 in Flutter**

*If TrackMe helped you move more, give it a ⭐ on GitHub — it means everything.*

<br/>

[![GitHub stars](https://img.shields.io/github/stars/yourusername/trackme?style=social)](https://github.com/codest0411/TrackMe.apk)
&nbsp;&nbsp;

<br/>

> *Track every step. Build every habit. Become your best self.*

</div>
