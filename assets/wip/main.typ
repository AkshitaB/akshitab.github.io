// CV in Typst — Akshita Bhagia
// Inspired by basic-typst-resume-template (stuxf)

#let accent-color = rgb("#176326") // MidnightBlue

#set document(title: "Akshita Bhagia - CV", author: "Akshita Bhagia")
#set page(
  paper: "us-letter",
  margin: 0.5in,
)
#set text(font: "New Computer Modern", size: 11pt, ligatures: false)
#set par(justify: false)

// Link styling
#show link: underline
#show link: set text(fill: accent-color)

// Section headings (level 1): small caps + rule
#show heading.where(level: 1): it => {
  v(-2pt)
  pad(bottom: -10pt)[#smallcaps(it.body)]
  line(length: 100%, stroke: 0.5pt)
}

// Subsection headings (level 2): plain bold, no rule
#show heading.where(level: 2): it => {
  v(6pt)
  text(size: 1.05em, weight: "bold", style: "normal")[#it.body]
  v(2pt)
}

// ---- Layout helpers ----

#let generic-two-by-two(top-left, top-right, bottom-left, bottom-right) = [
  #top-left #h(1fr) #top-right \
  #bottom-left #h(1fr) #bottom-right
]

#let dates-helper(start-date, end-date) = {
  start-date + " " + $dash.em$ + " " + end-date
}

#let edu(institution: "", location: "", degree: "", dates: "") = {
  generic-two-by-two(
    strong(institution), location,
    emph(degree), emph(dates),
  )
}

#let work(company: "", location: "", title: "", dates: "") = {
  generic-two-by-two(
    strong(company), location,
    emph(text(size: 0.95em)[#title]), emph(text(size: 0.95em)[#dates]),
  )
}

#let work-promo(company: "", location: "", title1: "", dates1: "", title2: "", dates2: "") = [
  #strong(company) #h(1fr) #location \
  #emph(text(size: 0.95em)[#title1]) #h(1fr) #emph(text(size: 0.95em)[#dates1]) \
  #emph(text(size: 0.95em)[#title2]) #h(1fr) #emph(text(size: 0.95em)[#dates2])
]

// Bold own name in bibliography output via show rule
// (Matches however the CSL style renders the name)
#let bold-name(body) = {
  show "A. Bhagia": strong
  show "Akshita Bhagia": strong
  body
}

// ========== HEADING ==========

#grid(
  columns: (1fr, auto),
  align: (left, right),
  [
    #text(size: 1.5em, weight: "bold")[#link("https://akshitab.github.io")[#text(fill: black)[Akshita Bhagia]]] \
    #link("https://akshitab.github.io")[#text(fill: black)[https://akshitab.github.io]] \
    Natural Language Processing, Machine Learning, Deep Learning
  ],
  [
    Email: #link("mailto:akshita23bhagia@gmail.com")[akshita23bhagia\@gmail.com]
  ],
)

// ========== EXPERIENCE ==========

= Experience

#work-promo(
  company: "Allen Institute for Artificial Intelligence (AI2)", location: "Seattle, WA",
  title1: "Senior Research Engineer", dates1: dates-helper("Jul 2021", "Present"),
  title2: "Research Engineer 2", dates2: dates-helper("Jul 2020", "Jun 2021"),
)
- Academic R&D in natural language processing (NLP). See list below for publications.
  - *Open Language Model (OLMo)*: Core contributions in dataset creation, model training, evaluation, and inference.
  // - *Open-source libraries*: #link("https://github.com/allenai/OLMo")[OLMo], #link("https://github.com/allenai/dolma")[dolma], #link("https://github.com/allenai/ai2-olmo-eval")[ai2-olmo-eval], #link("https://github.com/allenai/wimbd")[wimbd], #link("https://github.com/allenai/catwalk")[ai2-catwalk], #link("https://github.com/allenai/allennlp")[allennlp], #link("https://github.com/allenai/tango")[ai2-tango], #link("https://github.com/allenai/tailor")[ai2-tailor]
  // - *Datasets*: #link("https://huggingface.co/datasets/allenai/paloma")[PALOMA], #link("https://huggingface.co/datasets/allenai/dolma")[DOLMa], #link("https://huggingface.co/datasets/allenai/wmt22_african")[WMT22 African (release)], #link("https://huggingface.co/datasets/allenai/nllb")[No Language Left Behind NLLB (release)]

#work(
  company: "Cerebellum Capital", location: "San Francisco, CA",
  title: "Machine Learning Intern", dates: dates-helper("May 2019", "Aug 2019"),
)
- Adapted state-of-the-art deep learning models for financial time-series forecasting using Keras and Tensorflow.

#work-promo(
  company: "InFoCusp", location: "Ahmedabad, India",
  title1: "Lead Platform Development Engineer", dates1: dates-helper("Feb 2018", "Jun 2018"),
  title2: "Research Programmer", dates2: dates-helper("Jul 2015", "Jan 2018"),
)
- Engineered the core infrastructure of a data science platform used for R&D as well as production of financial models.

// ========== EDUCATION ==========

= Education

#edu(
  institution: "University of Washington", location: "Seattle, WA",
  degree: "Non-degree course enrollment (NLP for Cultural Analytics);  GPA: 4.00/4.00",
  dates: dates-helper("Jan 2023", "March 2023"),
)

#edu(
  institution: "University of Massachusetts, Amherst", location: "Amherst, MA",
  degree: "Master of Science in Computer Science;  GPA: 4.00/4.00",
  dates: dates-helper("Sep 2018", "May 2020"),
)

#edu(
  institution: "Dhirubhai Ambani Institute of Information and Communication Technology", location: "Gandhinagar, India",
  degree: "Bachelor of Technology in Information and Communication Technology;  GPA: 8.95/10",
  dates: dates-helper("Jul 2011", "May 2015"),
)

= Relevant courses
NLP for Cultural Analytics, Machine Learning, Neural Networks, Deep Learning for NLP, Systems for Data Science, Advanced Algorithms

// ========== PUBLICATIONS ==========

= Publications

== Peer-reviewed Conference Papers

#bold-name[
  #set cite(form: "full")
  #list(
    marker: sym.bullet,
    spacing: 7pt,
    cite(<Magnusson2025DataDecideHT>),
    cite(<Muennighoff2024OLMoEOM>),
    cite(<Groeneveld2024OLMoAT>),
    cite(<Soldaini2024DolmaAO>),
    cite(<Magnusson2023PalomaAB>),
    cite(<elazar-wimbd>),
    cite(<hint>),
    cite(<Wu2022>),
    cite(<Palaskar2022OnAI>),
  )
]

== Workshops and Preprints

#bold-name[
  #set cite(form: "full")
  #list(
    marker: sym.bullet,
    spacing: 7pt,
    cite(<OLMo20242O2>),
    cite(<bhagia2024establishingtaskscalinglaws>),
    cite(<Groeneveld2023CatwalkAU>),
    cite(<Richardson2023GEMabstract>),
  )
]

// Hidden bibliography (loads bib data but doesn't render)
#show bibliography: none
#bibliography(("publications_peer_reviewed.bib", "publications_workshops_preprints.bib"), style: "cv.csl")

// ========== SERVICE ==========

= Service

- *Reviewer*
  - COLING (2025).
  - DHTech workshop at DH2024.
  - WiNLP workshop at EMNLP (2024).
  - ACL Rolling Review (Jun 2024, Apr 2024, Feb 2024); conferences: ACL, EMNLP.
  - LREC-COLING (2024); emergency reviewer.
- *Co-organizer* for #link("https://www.statmt.org/wmt22/large-scale-multilingual-translation-task.html")[2022 WMT Shared Task on Large Scale Machine Translation Evaluation for African Languages].
- *Co-organizer* for #link("https://allennlp-hackathon.apps.allenai.org/")[AllenNLP Hacks 2021] hackathon.
- *Master's chair* for the graduate chapter of #link("http://cswomenumass.github.io/index.html")[UMass Amherst CSWomen] (Feb 2019 -- May 2020); handled monthly travel grants.

// ========== TALKS AND PANELS ==========

= Talks and Panels

- #link("https://neurips.cc/virtual/2024/tutorial/99526")[Tutorial on data preparation, model training, and adaptation] at NeurIPS (December 2024).
- Panel on RSEs in domain-specific ecosystems at the US-RSE conference (October 2024).
- Open Source AI panel at the #link("https://lu.ma/mxcx5bia")[AI/ALL Summit: Future of Equitable and Inclusive AI] (August 2024).
- Presenter on the #link("https://www.youtube.com/watch?v=Pwi72Lwe-bA")[Databricks webinar] for the OLMo project (March 2024).
- Interviewed by Sam Charrington on the #link("https://twimlai.com/podcast/twimlai/olmo-everything-you-need-to-train-an-open-source-llm/")[TWiML podcast] about the OLMo project (March 2024).
- Workshop on the AllenNLP library at AllenNLP Hacks 2021.
- Workshop on Running experiments on Google Colaboratory at AllenNLP Hacks 2021.
- Panelist on the GHC Information Panel at UMass CICS in Spring 2020.

// ========== AWARDS ==========

= Awards

- Geekwire Innovation of the Year 2024 Award for OLMo.
- Recipient of the AnitaB.org Grace Hopper Conference Scholarship 2019.

// ========== MENTORING ==========

= Mentoring

- *Pranjali Basmatkar*, Research Engineering Intern \@ AI2 (Summer 2023).
- *Sunitha Selvan*, Research Engineering Intern \@ AI2 (Summer 2022).
- *Arjun Subramonian*, Research Engineering Intern \@ AI2 -- *AI2 Intern of the Year* (Summer 2021).
- *Subhodeep Maji*, Research Programmer Intern \@ InFoCusp (Spring 2017).
