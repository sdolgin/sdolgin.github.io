---
layout: post
title: "Why Your Next Refactor Should Be Your SLOs"
date: 2025-07-08 12:00:00 -0000
categories: tutorial reliability engineering
tags: [slo, sre, reliability, observability]
excerpt: "A guide to understanding Service-Level Objectives (SLOs) and their importance in software reliability."
---

# Why Your Next Refactor Should Be Your SLOs

> "If your software isn’t serving the user, it’s serving no one." - probably someone on Server Fault, definitely someone who cared.

## TL;DR

- **Service‑Level Objectives (SLOs)** are the reliability North Stars that keep your **users** happy and your **engineers** sane.
- They only work when you start from the **customer perspective**: what are they paying for, clicking on, and depending on?
- This post gives you a **repeatable playbook** for discovering the right metrics across an entire portfolio of apps, APIs, and anything else with a port number.
- **Part 2** (coming soon) will dive into scaling high‑quality **Service‑Level Indicators (SLIs)** without turning your observability bill into a second mortgage.

---

## Wait, Why SLOs Again?

Picture this: you’re pushing code at 2 a.m., sipping a cold brew that tastes like existential dread, and PagerDuty explodes. Cue the production *whodunit*. Now imagine instead that you *already know* which parts of the system can wobble without breaking the customer experience and which can’t. That’s life with SLOs.

Chapter 4 of Google’s **[Site Reliability Engineering Book — Service Level Objectives](https://sre.google/sre-book/service-level-objectives/)** calls them “a principled way of describing the desired reliability of a service.” That’s SRE‑speak for *“measure success where it matters and stop sweating every blip.”*

## The Customer Lens: Start Here or Don’t Bother

SLOs fail when you start with the logs instead of the humans. Ask:

- **What do customers think they’re buying?** (Hint: it’s not your micro‑service graph.)
- **Which features keep the CFO paying the invoice?**
- **Is there a contractual SLA?** If so, congratulations! You *already* have the guardrails; just turn them into living metrics.
- **Where’s the "gotta work" moment?** That screen, API call, or button where frustration becomes rage‑quit.

> An SLO that doesn’t map to a customer "moment of truth" is just latency wallpaper.

## A Portfolio‑Ready Playbook for Discovering SLOs

Use this checklist (rinse, repeat, automate).

1. **Inventory the User Journeys**\
   List end‑to‑end scenarios ("search → checkout → confirmation email"). Whiteboard, sticky notes, Miro board... whatever you prefer.
2. **Rank by User Value**\
   Sort journeys by revenue impact, frequency, or pure human pain when broken.
3. **Decompose to Critical Transactions**\
   For each journey, isolate *atomic* interactions (API call, DB query, third‑party webhook). These are potential **SLIs**.
4. **Map Existing SLAs & Contracts**\
   If legal already promised "five nines" somewhere, write it down. Reality check optional but recommended.
5. **Choose Canonical SLIs**\
   *Success/Failure Rate*, *Availability/Uptime*, *Latency* (p99, p95...), *Throughput*, maybe *Freshness* or *Correctness* for data products.
6. **Set Draft Targets**\
   Pick numbers with both **engineering feasibility** and **business value**. (Hate math? Start at 99% and tweak.)
7. **Validate with Real Users**\
   Show a dashboard mock‑up to product and support; adjust when they laugh/cry.
8. **Publish & Track**\
   Dashboard, alerting, weekly SRE review. If no one can find it, it doesn’t exist.
9. **Iterate Quarterly**\
   Your product evolves; so must your SLOs. Otherwise you’ll be guarding a museum piece.

Stick this playbook in your README so the next project inherits it by copy‑pasting instead of reinventing.

## Canonical SLIs: The Greatest Hits

| SLI              | What It Measures                                   | Why Users Care                          |
| ---------------- | -------------------------------------------------- | --------------------------------------- |
| **Success Rate** | Successful Requests / Total Requests               | Errors are bad, duh.                    |
| **Availability** | Percentage of time the service answered *anything* | Keeps the "Is it down?" tweets away.    |
| **Latency**      | Time from request to useful response               | Nobody likes a spinning loader.         |
| **Throughput**   | Requests per second / MB per second                | Scale or bail.                          |
| **Freshness**    | Age of the data served                             | Because yesterday’s balance is useless. |

Pick a subset; don’t ship the whole buffet to every service.

## Putting It All Together: A Mini‑Example

*Product*: Image‑sharing API\
*Customer Moment*: Upload → Share link within 2 seconds\
*SLI Candidates*: 95th‑percentile upload latency ≤ 1.8 s, success rate ≥ 99.2%, link availability ≥ 99.9%\
*Draft SLO*: "95% of image uploads complete in under 2 seconds, measured over rolling 28‑day windows."

> Notice how the numbers hug the customer expectation, not the engineering ego.

## Up Next…

In **Part 2** we’ll dive into building **high‑quality SLIs** that scale: how to collect signals without DDoSing your own observability stack, and how to keep them accurate when your architecture grows six more tentacles. Stay tuned!

