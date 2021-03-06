<h2>Notification settings</h2>

<p>Select, about what events to receive notification messages:</p>

<p id="saveNoticeSuccess" style="display: none; margin: 10px 0; color: green">Settings saved!</p>

<p style="margin: 0">
	<label class="checkbox inline">
	<input type="checkbox" id="task" name="task" {% if not registry.ajax_notice_sets.task %}checked="checked"{% endif %} />
	tasks
	</label>
</p>

<p style="margin: 0">
	<label class="checkbox inline">
	<input type="checkbox" id="com" name="com" {% if not registry.ajax_notice_sets.com %}checked="checked"{% endif %} />
	comments
	</label>
</p>

<p style="margin: 0">
	<label class="checkbox inline">
	<input type="checkbox" id="mail" name="mail" {% if not registry.ajax_notice_sets.mail %}checked="checked"{% endif %} />
	mail
	</label>
</p>

<p style="margin: 0">
	<label class="checkbox inline">
	<input type="checkbox" id="obj" name="obj" {% if not registry.ajax_notice_sets.obj %}checked="checked"{% endif %} />
	objects
	</label>
</p>

<p style="margin: 0">
	<label class="checkbox inline">
	<input type="checkbox" id="info" name="info" {% if not registry.ajax_notice_sets.info %}checked="checked"{% endif %} />
	knowledge base
	</label>
</p>

<p style="padding-top: 20px"><input type="button" value="Save" onclick="saveNotice()" /></p>

<script type="text/javascript">
function saveNotice() {
	if ($("#task").attr('checked')) { var task = 0; } else { var task = 1; };
	if ($("#com").attr('checked')) { var com = 0; } else { var com = 1; };
	if ($("#mail").attr('checked')) { var mail = 0; } else { var mail = 1; };
	if ($("#obj").attr('checked')) { var obj = 0; } else { var obj = 1; };
	if ($("#info").attr('checked')) { var info = 0; } else { var info = 1; };
	
	var data = "action=saveNotice&task=" + task + "&com=" + com + "&mail=" + mail + "&obj=" + obj + "&info=" + info;
	$.ajax({
		type: "POST",
		url: "{{ registry.uri }}ajax/dashboard/",
		data: data,
		success: function(res) {
			$("#saveNoticeSuccess").show();
		}
	});
}
</script>