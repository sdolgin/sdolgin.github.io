---
layout: page
title: Blog
permalink: /blog/
---

<div class="blog-index">
  {% if site.posts.size > 0 %}
    <ul class="post-list">
      {%- for post in site.posts -%}
      <li class="post-item">
        {%- assign date_format = site.minima.date_format | default: "%b %-d, %Y" -%}
        <span class="post-meta">{{ post.date | date: date_format }}</span>
        <h3>
          <a class="post-link" href="{{ post.url | relative_url }}">
            {{ post.title | escape }}
          </a>
        </h3>
        
        <div class="post-excerpt">
          {{ post.excerpt | strip_html | truncatewords: 50 }}
        </div>

        {%- if post.categories.size > 0 -%}
          <div class="post-categories">
            Categories: 
            {%- for category in post.categories -%}
              <span class="category">{{ category }}</span>{% unless forloop.last %}, {% endunless %}
            {%- endfor -%}
          </div>
        {%- endif -%}

        {%- if post.tags.size > 0 -%}
          <div class="post-tags">
            {%- for tag in post.tags -%}
              <span class="tag">#{{ tag }}</span>{% unless forloop.last %} {% endunless %}
            {%- endfor -%}
          </div>
        {%- endif -%}
      </li>
      {%- endfor -%}
    </ul>
  {% else %}
    <p>No posts yet!</p>
  {% endif %}
</div>
