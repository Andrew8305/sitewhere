<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="sitewhere_title" value="View Tenant" />
<c:set var="sitewhere_section" value="tenants" />
<c:set var="use_highlight" value="true" />
<c:set var="use_bxslider" value="true" />
<%@ include file="../includes/top.inc"%>

<style>
div.wz-header {
	border: 1px solid #666;
	background-color: #eee;
	padding: 13px;
	margin-bottom: 10px;
	-webkit-box-shadow: 4px 4px 4px 0px rgba(192, 192, 192, 0.5);
	-moz-box-shadow: 4px 4px 4px 0px rgba(192, 192, 192, 0.5);
	box-shadow: 4px 4px 4px 0px rgba(192, 192, 192, 0.5);
}

div.wz-header h1 {
	font-size: 26px;
	line-height: 1em;
	vertical-align: top;
	margin: 1px;
	display: inline;
}

div.wz-header h2 {
	font-size: 16px;
	margin: 0;
	margin-top: 15px;
	line-height: 1.1em;
	font-weight: normal;
	clear: both;
	line-height: 1.1em;
}

.wz-header-icon {
	float: left;
	padding-right: 10px;
	font-size: 26px;
}

.wz-drag-icon {
	padding: 10px 10px 10px 5px;
	font-size: 20px;
	color: #ccc;
	cursor: move;
	float: left;
	border-right: 1px solid #ccc;
}

.wz-role {
	border: 1px solid #999;
	padding: 15px 10px 10px;
	position: relative;
	margin: 10px 0px 25px;
	box-shadow: 4px 4px 4px 0px rgba(192, 192, 192, 0.3);
}

.wz-role-label {
	position: absolute;
	top: -10px;
	left: 5px;
	font-size: 12px;
	background-color: #999;
	color: #fff;
	padding: 1px 5px;
}

.wz-role-required {
	border-width: 2px;
}

.wz-role-label-required {
	background-color: #666;
}

.wz-role-missing {
	border: 1px solid #cc3;
	background-color: #ffe;
}

.wz-role-missing-optional {
	border: 1px solid #eee;
	box-shadow: none;
}

.wz-role-label-missing {
	
}

.wz-child {
	border: 1px solid #ccc;
	background-color: #eee;
	padding: 5px;
	margin-bottom: 5px;
	list-style-type: none;
	list-style-position: inside;
}

.wz-child-required {
	border-width: 2px;
}

.wz-child-missing {
	border-style: dashed;
	border-color: #999;
}

.wz-child .wz-child-icon {
	float: left;
	padding: 8px 10px;
	font-size: 22px;
}

.wz-child .wz-child-name {
	display: inline;
	font-size: 20px;
	padding: 0;
	margin: 0;
}

.wz-child .wz-child-nav {
	float: right;
	padding: 9px;
}

.wz-sortable-placeholder {
	min-height: 40px;
	border: 2px dashed #aaa;
	background-color: #ccc;
	padding: 5px;
	margin-bottom: 5px;
	list-style-type: none;
	list-style-position: inside;
	border: 2px dashed #aaa;
}

.wz-sortable-item {
	
}

.dd-icon {
	width: 20px;
}

div.wz-divider {
	clear: both;
	padding-top: 10px;
	margin-top: 10px;
	border-top: 1px solid #ddd;
}

ol.wz-breadcrumb {
	margin-top: 8px;
	margin-bottom: -2px;
	margin-right: 6px;
	margin-left: 6px;
	padding: 2px 8px;
	border: 1px solid #eee;
	border-radius: 0px;
	font-size: 12px;
	background-color: #f9f9f9;
}

.sw-attribute-group {
	border: 1px solid #ccc;
	padding: 25px 10px 10px;
	margin-bottom: 20px;
	position: relative;
	margin-top: 5px;
}

.sw-attribute-group h1 {
	margin: 0;
	padding: 2px 5px;
	font-size: 12px;
	line-height: 1em;
	position: absolute;
	background-color: #666;
	color: #fff;
	top: -9px;
}

label.sw-control-label {
	font-weight: bold;
	font-size: 17px;
	width: 250px;
}

label.sw-control-label i {
	color: #ccc;
	padding-left: 5px;
	margin-top: 2px;
	vertical-align: top;
	font-size: 10px;
}

div.sw-controls {
	margin-left: 290px;
	font-size: 17px;
	line-height: 1.7em;
}

div.wz-button-bar {
	padding: 10px 0px;
	margin-top: 10px;
	border-top: 1px solid #ddd;
}
</style>

<!-- Title Bar -->
<div class="sw-title-bar content k-header" style="margin-bottom: 15px;">
	<h1 class="ellipsis" data-i18n="tenant.detail.title">View Tenant</h1>
	<div class="sw-title-bar-right">
		<a id="btn-refresh-tenant" class="btn" href="javascript:void(0)">
			<i class="fa fa-refresh sw-button-icon"></i> <span
			data-i18n="public.Refresh">Refresh</span>
		</a>
	</div>
</div>

<div id="tenant-details" style="line-height: normal;"></div>

<!-- Tab panel -->
<div id="tabs">
	<ul>
		<li class="k-state-active"><font
			data-i18n="tenants.detail.EngineConfiguration"></font></li>
		<li><font data-i18n="tenants.detail.EngineState"></font></li>
	</ul>
	<div>
		<div>
			<div>
				<div id="tve-config-editor">
					<div id="tve-config-page"></div>
				</div>
			</div>
		</div>
		<div class="wz-button-bar">
			<div style="float: right;">
				<a id="btn-stage-updates" href="javascript:void(0)"
					class="btn btn-primary" data-i18n="tenant.editor.stage">Stage
					Updates</a>
			</div>
			<div style="clear: both;"></div>
		</div>
	</div>
	<div>
		<div id="detail-content"></div>
	</div>
</div>

<form id="view-tenant-list" method="get"></form>

<%@ include file="tenantCreateDialog.inc"%>
<%@ include file="configEditDialog.inc"%>
<%@ include file="tenantHeader.inc"%>
<%@ include file="tenantEntry.inc"%>

<!-- Details panel shown for a started engine -->
<script type="text/x-kendo-tmpl" id="tpl-engine-started">
	<div>
		<div id="tenant-engine-hierarchy" style="margin-top: 10px; margin-bottom: 10px; max-height: 500px; overflow-y: scroll;"></div>
	</div>
</script>

<!-- Details panel shown for a stopped engine -->
<script type="text/x-kendo-tmpl" id="tpl-engine-stopped">
	<div style="text-align: center; font-size: 26px; padding: 50px;">
		<i class="fa fa-power-off sw-button-icon" style="color: \\#ccc;"></i> Tenant Engine is Stopped
	</div>
</script>

<!-- Details panel shown for a engine in other non-running states -->
<script type="text/x-kendo-tmpl" id="tpl-engine-not-running">
	<div style="text-align: center; font-size: 26px; padding: 50px;">
		<i class="fa fa-power-off sw-button-icon" style="color: \\#ccc;"></i> Tenant Engine is Not Running
	</div>
</script>

<script>
	/** Selected tenant id */
	var tenantId = '<c:out value="${selected.id}"/>';

	/** Tenant configuration model */
	var configModel = <c:out value="${configModel}" escapeXml="false"/>;

	/** Configuration element roles */
	var roles = <c:out value="${roles}" escapeXml="false"/>;

	/** Sites for tenant */
	var sites = <c:out value="${sites}" escapeXml="false"/>;

	/** Specifications for tenant */
	var specifications = <c:out value="${specifications}" escapeXml="false"/>;

	/** Configuration being edited */
	var config;

	/** Tenant information */
	var tenant;

	/** Tabs */
	var tabs;

	/** Context stack for editor */
	var editorContexts = [];

	/** Called when delete button is clicked */
	function onDeleteClicked() {
		swConfirm("Delete Tenant", "Are you sure you want to delete tenant '" + tenantId + "'?", function(result) {
			if (result) {
				$.deleteAuthJSON("${pageContext.request.contextPath}/api/tenants/" + tenantId + "?force=true",
						"${basicAuth}", "${tenant.authenticationToken}", onDeleteSuccess, onDeleteFail);
			}
		});
	}

	/** Called on successful delete */
	function onDeleteSuccess() {
		$("#view-tenant-list").attr("action", "${pageContext.request.contextPath}/admin/tenants/list.html");
		$('#view-tenant-list').submit();
	}

	/** Handle failed delete call */
	function onDeleteFail(jqXHR, textStatus, errorThrown) {
		handleError(jqXHR, "Unable to delete tenant.");
	}

	/** Called when config button is clicked */
	function onConfigClicked() {
		tveOpen(tenantId, onConfigSuccess);
	}

	/** Called on successful config */
	function onConfigSuccess() {
	}

	/** Called when edit button is clicked */
	function onEditClicked() {
		tuOpen(tenantId, onEditSuccess);
	}

	/** Called on successful edit */
	function onEditSuccess() {
		loadTenant();
	}

	/** Called when stop button is clicked */
	function onTenantStopClicked() {
		$.postAuthJSON("${pageContext.request.contextPath}/api/tenants/" + tenantId + "/engine/stop", null,
				"${basicAuth}", "${tenant.authenticationToken}", commandSuccess, stopFailed);
	}

	/** Called after successfully starting or stopping tenant */
	function commandSuccess(data, status, jqXHR) {
		window.location.reload();
	}

	function stopFailed(jqXHR, textStatus, errorThrown) {
		handleError(jqXHR, "Unable to process engine stop command.");
	}

	/** Called when start button is clicked */
	function onTenantStartClicked() {
		$.postAuthJSON("${pageContext.request.contextPath}/api/tenants/" + tenantId + "/engine/start", null,
				"${basicAuth}", "${tenant.authenticationToken}", commandSuccess, startFailed);
	}

	function startFailed(jqXHR, textStatus, errorThrown) {
		handleError(jqXHR, "Unable to process engine start command.");
	}
<%@ include file="configEditLogic.js"%>
	$(document).ready(function() {

		/** Handle refresh button */
		$('#btn-refresh-tenant').click(function(event) {
			loadTenant();
		});

		/** Handle 'stage updates' button */
		$('#btn-stage-updates').click(function(event) {
			stageUpdates();
		});

		/** Create the tab strip */
		tabs = $("#tabs").kendoTabStrip({
			animation : false,
		}).data("kendoTabStrip");

		loadTenant();
		loadEngineConfiguration();
	});

	/** Loads information for the selected tenant */
	function loadTenant() {
		$.getAuthJSON("${pageContext.request.contextPath}/api/tenants/" + tenantId + "?includeRuntimeInfo=true",
				"${basicAuth}", "${tenant.authenticationToken}", loadGetSuccess, loadGetFailed);
	}

	/** Called on successful tenant load request */
	function loadGetSuccess(data, status, jqXHR) {
		parseEntityData(data);
		tenant = data;
		var template = kendo.template($("#tpl-tenant-detail-header").html());
		$('#tenant-details').html(template(data));

		if (tenant.engineState) {
			if (data.engineState.lifecycleStatus == 'Started') {
				$('#tenant-power-off').show();
				$('#tenant-power-on').hide();
				$('#tenant-edit').hide();
				$('#tenant-delete').hide();
				template = kendo.template($("#tpl-engine-started").html());
				$('#detail-content').html(template(data));
				loadEngineHierarchy(data);
			} else if (data.engineState.lifecycleStatus == 'Stopped') {
				$('#tenant-power-off').hide();
				$('#tenant-power-on').show();
				$('#tenant-edit').show();
				$('#tenant-delete').show();
				template = kendo.template($("#tpl-engine-stopped").html());
				$('#detail-content').html(template(data));
			} else if (data.engineState.lifecycleStatus == 'Error') {
				$('#tenant-power-off').hide();
				$('#tenant-power-on').show();
				$('#tenant-edit').show();
				$('#tenant-delete').show();
				template = kendo.template($("#tpl-engine-stopped").html());
				$('#detail-content').html(template(data));
			} else {
				$('#tenant-power-off').hide();
				$('#tenant-power-on').hide();
				$('#tenant-edit').hide();
				$('#tenant-delete').hide();
				template = kendo.template($("#tpl-engine-not-running").html());
				$('#detail-content').html(template(data));
			}
		} else {
			$('#tenant-power-off').hide();
			$('#tenant-power-on').show();
			$('#tenant-edit').show();
			$('#tenant-delete').show();
			template = kendo.template($("#tpl-engine-not-running").html());
			$('#detail-content').html(template(data));
		}
	}

	/** Handle error on getting tenant data */
	function loadGetFailed(jqXHR, textStatus, errorThrown) {
		handleError(jqXHR, "Unable to load tenant data.");
	}

	/** Stage updated configuration */
	function stageUpdates() {
		swConfirm("Stage Configuration", "Are you sure you want to stage the updated tenant configuration?", function(
				result) {
			if (result) {
				$.postAuthJSON("${pageContext.request.contextPath}/api/tenants/" + tenant.id
						+ "/engine/configuration/json", config, "${basicAuth}", "${tenant.authenticationToken}",
						stageSuccess, stageFail);
			}
		});
	}

	/** Called on successful create */
	function stageSuccess() {
		loadTenant();
	}

	/** Handle failed call to create tenant */
	function stageFail(jqXHR, textStatus, errorThrown) {
		handleError(jqXHR, "Unable to stage tenant configuration.");
	}

	/** Load engine hierarchy into tree */
	function loadEngineHierarchy(engine) {
		var dataSource = new kendo.data.TreeListDataSource({
			data : engine.engineState.componentHierarchyState,
			schema : {
				model : {
					id : "id",
					expanded : true
				}
			}
		});

		$("#tenant-engine-hierarchy").kendoTreeList({
			dataSource : dataSource,
			columns : [ {
				field : "name",
				title : "Component Name",
				width : 400
			}, {
				field : "type",
				title : "Type",
				width : 150
			}, {
				field : "status",
				title : "Status",
				width : 150
			} ]
		});
	}

	/** Load the running engine configuration as JSON */
	function loadEngineConfiguration() {
		$.getAuthJSON("${pageContext.request.contextPath}/api/tenants/" + tenantId + "/engine/configuration/json",
				"${basicAuth}", "${tenant.authenticationToken}", jsonConfigGetSuccess, jsonConfigGetFailed);
	}

	/** Called on successful configuration load request */
	function jsonConfigGetSuccess(data, status, jqXHR) {
		config = data;
		resetWizard();
	}

	/** Handle error on getting configuration data */
	function jsonConfigGetFailed(jqXHR, textStatus, errorThrown) {
		handleError(jqXHR, "Unable to load tenant configuration as JSON.");
	}
</script>

<%@ include file="../includes/bottom.inc"%>