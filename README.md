# Pomalo · learning Serbian little by little

Pomalo is a Serbian ⇄ English course for children and beginners, with Vrapko the sparrow as a guide.

## What's inside

| Path | What it is |
|---|---|
| `index.html` | The whole app in one file: 13 lessons, Vrapko, pictures, songs, stars, mistake review |
| `content/` | Lesson sentences as JSON (Lessons 2–6 and 11–13), for the future Supabase version |
| `docs/course-plan.md` | Plan for Lessons 11–48, taken from the notebook covers |
| `tools/heic-to-jpeg.html` | Converts iPhone HEIC photos to JPEG in the browser |
| `notebooks/` | Photos of the handwritten notebook pages |

## Features

- **Two directions:** English → Serbian, and Serbian → English
- **Both variants and scripts:** Ekavian or Ijekavian, Latin or Cyrillic, chosen once at registration
- **Difficulty that grows:** choose the translation → choose the missing word → type the missing word → translate the whole sentence
- **Mistake review:** every new session starts by practising earlier mistakes
- **Vrapko the sparrow:** cheers, encourages, and sings a short song after each exercise
- **Pictures:** 91 cartoon pictures of food, animals and everyday things
- **Progress map:** one dot per lesson, with 1–3 stars for each finished lesson

## Run it

**On your computer:** download `index.html` and double-click it.

**Online with GitHub Pages (free):**
1. In this repository, open **Settings → Pages**.
2. Under **Build and deployment**, set **Source** to **Deploy from a branch**.
3. Choose branch **main** and folder **/ (root)**, then click **Save**.
4. After a minute or two, the app is live at `https://milossavicgit.github.io/learning-serbian/`.

## Where progress is saved

In this version, each learner's registration, progress and stars are saved **in the browser on that device**.

Accounts, progress on any device, and a teacher or parent view of all learners are planned for the Supabase version.
