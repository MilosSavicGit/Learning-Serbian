# Pomalo course plan

Notebook order (from the author):
1. Beginner notebook: done (Lessons 1–13)
2. Eagle notebook: done (Lessons 17–25)
3. Yellow notebook ("You too is beautiful"): next. Abstract objects 2, Infinitive 2, Medical, Future, Gerund, Arts, Future perfect, Abstract objects 3, Subjunctive, Science
4. Blue notebook 1: Determiners, Present 3, Present perfect, Adjectives 2, Infinitive 1, Pronouns, Formal you, Imperative, Education
5. Blue notebook 2 ("THE END"): Conditional, Modal verbs, Conditional perfect, Communication–Nature, Subjunctive perfect, Business, Subjunctive imperfect, Passato remoto, Spiritual, Politics

Levels:
- Level 1 · Basics: notebooks 1–3 (Beginner, Eagle, Yellow)
- Level 2 · Advanced: notebooks 4–5 (Blue 1, Blue 2)

Lessons 14–16 (This/that/every, Present, Past) were written from the Blue 1 cover before its pages arrived.
They will be replaced by the real Blue 1 sentences and move into Level 2.

## Rule: every sentence lists all its correct answers

Whenever a lesson is added or changed, each sentence must list **every natural correct translation**, not only the one from the notebook. This applies to both directions, English → Serbian and Serbian → English. A correct answer must never be rejected in a lesson, in mistake review or in the A1 test.

Add as separate accepted answers:
- **Serbian:** synonyms (ispit/test, bioskop/kino), other constructions (postaje hladna / se hladi; moram da idem / moram ići), both genders when the English doesn't say (umoran/umorna, bio/bila), ti and vi forms for "you", and both Ekavian and Ijekavian forms.
- **English:** "I go" / "I am going", he/she/it/they when Serbian drops the pronoun, synonyms (big/large, start/begin, movie/film, soccer/football).

The answer checker in `index.html` already accepts these without listing them: word order in Serbian, adding or dropping ja/ti/on…, missing č/ć/š/ž/đ, Cyrillic, capitals, punctuation, contractions, a/an/the, British/American spelling. A single typo in a longer word gets "check your spelling" and another try.

## Rule: English is the base for every other language

Pomalo always pairs Serbian with one other language. **English is the base:** a new language (Italian, Danish, German…) is made by translating the **English** sentences, exercise names, titles and interface texts into that language. **Serbian is never changed** for another language: the Serbian sentences, their accepted answers, Nikola's recordings and the Serbian grammar examples stay exactly as they are and are shared by all languages.

Each language lives in one file, `lang/<code>.json` (e.g. `lang/it.json`), with its sentences (with all alternative answers), grammar pages, interface texts and Vrapko's lines. To add a language: create that file from English, add one entry to the language list in `index.html`, add its answer-checking rules, and allow its code in Supabase (`docs/supabase-languages.sql`).
