{% extends '_layout.swig' %}
{% import '_macro/post-collapse.swig' as post_template %}
{% import '_macro/sidebar.swig' as sidebar_template %}

{% block title %} {{ __('title.category') }}: {{ page.category }} | {{ config.title }} {% endblock %}

{% block content %}

    <h2 id="javafx">JavaFX</h2>
    <ul>
    <li><a href="https://redzealot2008.github.io/gitbook/javafx-html/index.html">《JavaFX应用程序添加HTML内容》</a></li></ul>
    <h2 id="shell">Shell</h2>
    <ul>
    <li><a href="https://redzealot2008.github.io/gitbook/30-shell/index.html">《30分钟玩转Shell脚本编程》</a></li></ul>

  {% include '_partials/pagination.swig' %}

{% endblock %}

{% block sidebar %}
  {{ sidebar_template.render(false) }}
{% endblock %}
