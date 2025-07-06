---
layout: post
title: "Surprising KQL Functions"
date: 2025-04-27 12:00:00 -0000
categories: tutorial kql azure data-explorer anomaly-detection
tags: [kql, azure, data-explorer, anomaly-detection, query-language]
excerpt: "A beginner's guide to understanding KQL and its surprising functions."
---

# The Unexpected Intelligence of a Query Language  
*Or: Why I Stopped Worrying and Learned to Love KQL*

> *“Exploration is not optional. It is how we become less wrong.”*  
> — Me, probably during a debugging rage spiral

---

I wasn’t looking for a time-series anomaly detector. I was just trying to find out why a log ingestion pipeline suddenly dropped half of our telemetry during the worst customer outage of the year. My brain was on fire. My tools were dull. And then someone said:

> “You should try Kusto.”

*“The thing named after a Belgian detective?”*  
Yeah, turns out it’s [Microsoft’s Azure Data Explorer](https://learn.microsoft.com/azure/data-explorer/)... basically a search engine for your telemetry. And it comes with a pipe.

A **very powerful pipe**.

---

## You think you know SQL? KQL will make you forget it.

At first glance, KQL looks like SQL’s little sibling who got a liberal arts degree and refuses to use semicolons. It’s pipe-driven, terse, tuned for speed. And yes, it was designed by the same folks who brought you Bing’s brain. Don’t hold that against it.

But the kicker? **KQL isn’t a query language.**  
Not really.

It’s a thinking tool.

---

## Let me walk you through some of its strange magic

### 1. Anomaly Detection Without Data Science Theater

You want anomalies? Don’t bother exporting to Jupyter or importing pandas. Just:

```kql
MyTable
| make-series cpu=avg(CPU) on Timestamp step 1h
| evaluate anomaly_detection(cpu, 3, -1, 'linefit')
```

No TensorFlow. No fake consultant dashboards. Just the truth.

### 2. Regex That Actually Works

You ever try parsing logs in a “traditional” SIEM? KQL’s `extract()` is a gift:

```kql
| extend ip = extract(@"\d{1,3}(\.\d{1,3}){3}", 0, RawText)
```

I use this daily. It hasn’t betrayed me. That’s rare.

### 3. Inline Python and ML Stuff

Sure, sometimes I still want Python. Fine. It’s here:

```kql
| evaluate python("result = df.describe()")
```

You don’t need it often. But when you do... it’s elegant, not bolted-on cruft.

### 4. Forking Queries. Yes, Forking.

SQL can't do this:

```kql
MyData
| fork (where Status == "Success", where Status == "Fail")
```

Parallel logic paths. Like a branching mind map for your telemetry. Freaky.

### 5. You Can Draw with It

Sometimes I need to see the failure, not just count it.

```kql
| render timechart
```

Don’t export to Excel. Stay in the moment. Stay in the mind.

### 6. It Eats External Data for Breakfast

Blob storage? Cosmos DB? CSV from 2015 on an FTP server?

```kql
externaldata(myField:string)
["https://path/to/blob.csv"]
with(format='csv')
```

If the data exists, KQL will probably talk to it.

---

## Why Does This Matter?

Because tools like this change your relationship with data.

ADX/KQL doesn’t ask you to predefine structure. It rewards curiosity. It encourages poking, prodding, and pushing until things make sense. And that—more than any flashy feature—is the mark of a tool built by engineers who have suffered.

KQL is the closest I’ve found to a query language that behaves like a reasoning partner. You give it clues. It gives you back intuition.

---

## Final Thought

You don’t need to love Microsoft to love KQL. You just need to be someone who’s been burned by traditional tooling—who’s sick of 3-layer dashboards that don’t answer real questions.

Use KQL the next time your system breaks.  
Not because it’s easy.  
But because it helps you get _less wrong_, faster.