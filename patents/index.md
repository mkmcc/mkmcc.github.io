---
title: ML and AI Patents
layout: page
Time-stamp: "2025-04-07 18:57:59 (mkmcc)"
---



Overview
--------

My work in machine learning has focused on building dependable,
interpretable models for challenging, low-resource environments.  Much
of this research was motivated by the need to extract signal from
noise in settings where data is messy, sparse, and limited in
quantity.  Data is often *very* expensive in industry, and collecting
more data, or curating a cleaner dataset, is simply not practical for
most projects.  I needed a technology which worked with the data I
had.  Rather than relying on brittle black-box techniques, I developed
statistically principled models informed by domain knowledge and
tailored to the structure of the data.

At the heart of this effort is the Hierarchical Pitman-Yor Process
(HPYP), a nonparametric Bayesian prior that captures the power-law and
hierarchical structure characteristic of natural language, biological
sequences, and other real-world data.  This process became the
foundation for a series of patents, ranging from foundational modeling
techniques to practical applications in classification and semantic
search.

While the patents listed below reflect research conducted during my
time at a previous employer, they laid the groundwork for many of the
core ideas behind [Sturdy Statistics](https://sturdystatistics.com).
Our current work builds on these insights using newer, more
expressive, and more useful models, along with more scalable inference
techniques.  Sturdy Statistics improved on these ideas and also makes
them practical for a wide range of users — from independent developers
and small companies, all the way up to enterprises with large data
science teams.  However, my central focus is always on robust,
explainable AI that works in the real world — even when data is
limited, noisy, and domain-specific.



Hierarchical Pitman-Yor Process as a Language Model
---------------------------------------------------

Like most recent NLP research, my innovation centers on an improved
language model.  Rather than using a
[*Transformer*](https://arxiv.org/abs/1706.03762) or some other
neural-network architecture, however, I chose to base my technology on
the [Hierarchical](https://sites.stat.columbia.edu/gelman/book/)
[Pitman-Yor
Process](https://projecteuclid.org/journals/annals-of-probability/volume-25/issue-2/The-two-parameter-Poisson-Dirichlet-distribution-derived-from-a-stable/10.1214/aop/1024404422.full).
This produces a cleanly structured language model, with analytic
properties that capture Zipfian distributions and hierarchical
dependencies across multiple levels of abstraction.  This approach to
representation learning provides the automated feature discovery of
Deep Learning, while also providing a principled statistical
foundation for modeling natural language, user behavior, and genomic
sequences with sparse, long-tailed statistics.

* [US11115520B2](https://patents.google.com/patent/US11115520B2)
  describes the base model, introducing a deep, self-conjugate HPYP
  hierarchy for document modeling.  This allows for composable models
  that reflect both global and local topic structure while preserving
  power-law behavior throughout the hierarchy.
* [US11429901B1](https://patents.google.com/patent/US11429901B1)
  extends the model by introducing a mixture prior that allows domain
  knowledge — in this case, predefined keyword clusters — to be
  embedded directly into the probabilistic framework.  This speeds up
  convergence, improves interpretability, and enhances performance on
  small, noisy datasets.
* [US11521601B2](https://patents.google.com/patent/US11521601B2) and
  [US11804216B2](https://patents.google.com/patent/US11804216B2)
  describe direct applications of these models, including systems for
  distinguishing spontaneous, natural conversation from recordings or
  automated agents.

These innovations enable models that are naturally interpretable,
data-efficient, and well-suited to domains where training data is
limited or costly to obtain.



Using HPYP-Derived Representations for Downstream Tasks
-------------------------------------------------------

One of the key advantages of HPYP-based models is that they produce
sparse, specific, and resilient latent representations — ideal for
downstream tasks such as classification, search, and clustering.
Unlike dense embeddings from neural networks, these structured
representations are robust to noise and easier to interpret.

* [US12230253B2](https://patents.google.com/patent/US12230253B2)
  applies these representations to phone call classification, using a
  joint topic-and-label model to identify the purpose of a
  conversation with high accuracy.  Because the topic model and
  classifier are trained jointly, the resulting predictions remain
  interpretable and adaptable to new domains.
* [US20240312451A1](https://patents.google.com/patent/US20240312451A1)
  (pending) builds on this by applying HPYP-derived features to
  semantic search, using Bayesian belief networks and domain-aware
  priors to index and retrieve documents based on inferred topic
  structure. This approach supports contextual retrieval even in
  low-data settings, while retaining transparency and explainability.
  
These downstream systems demonstrate the versatility of structured
probabilistic models: they can serve not only as generative tools, but
like deep learning, they can also serve as feature extractors for
supervised learning pipelines.



Techniques for Small, Noisy Datasets
------------------------------------

Much of this work was designed with low-resource environments in mind
— settings where data is scarce, noisy, or expensive to label.  In
these scenarios, models must be resilient to overfitting and robust to
label errors.

* [US10719783B2](https://patents.google.com/patent/US10719783B2)
  presents a technique for error-tolerant classification, using
  iterative refinement to identify mislabeled examples and improve
  model accuracy with minimal additional supervision.
* Several patents (including
  [US11115520B2](https://patents.google.com/patent/US11115520B2) and
  [US11429901B1](https://patents.google.com/patent/US11429901B1))
  emphasize sparse priors, which separate signal from noise and
  promote interpretable structure even in small datasets.
* The broader modeling framework emphasizes Bayesian model averaging,
  helping to isolate meaningful signals from noisy data while
  quantifying uncertainty — a crucial feature for sensitive
  applications.

These techniques collectively support a vision of AI that is both
statistically grounded and practically reliable, even when working
with limited data.



Looking Ahead
-------------

While the patents listed here describe earlier research, many of the
ideas they contain — sparse latent structure, mixture priors,
probabilistic semantics, and domain-aware modeling — remain central to
my current work.

At Sturdy Statistics, we’ve developed a new class of generative models
that go beyond these initial frameworks.  Our systems retain the core
goals of transparency, adaptability, and statistical rigor, while
incorporating newer inference techniques, more expressive priors, and
a focus on structured retrieval for downstream tasks, including
integration with large language models (LLMs) such as ChatGPT.  The
models are optimized for small datasets and support scientific use
cases in genomics, healthcare, and customer research in addition to
industry applications.

The inventions detailed in these patents set me on the path toward
Sturdy Statistics — but the journey continues.



<h2>Individual Patents</h2>

<p>
The following patents reflect the core innovations described above.
</p>

<ol reversed class="publist">
{% for patent in site.data.patents %}
    <li>
    <i>{{ patent.authors }},</i>
    <a href="{{ patent.url }}" target="_blank">{{ patent.title}}</a>.
    {{ patent.number}} {{ patent.date }}
    [<a href="pdf/{{ patent.file }}">PDF</a>]

    {% if patent.summary %}
      <p class="summary">{{ patent.summary }}</p>
    {% endif %}

    </li>
{% endfor %}
</ol>
