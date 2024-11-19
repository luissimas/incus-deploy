{% set ns = namespace() %}
{% set ns.next = 1 %}
{% for key, value in task_host_ids.items() %}
{% if value >= ns.next %}
{% set ns.next = value + 1 %}
{% endif %}
{{ key }}: {{ value }}
{% endfor %}
{% for host in vars['ansible_play_hosts'] %}
{% if not host in task_host_ids %}
{{ host }}: {{ ns.next }}
{% set ns.next = ns.next + 1 %}
{% endif %}
{% endfor %}
