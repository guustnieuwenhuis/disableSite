<cfcomponent extends="mura.plugin.pluginGenericEventHandler">

	<cffunction name="onSiteRequestStart" access="public" returntype="void" output="false">
		<cfargument name="event" />
		
		<cfset var local = StructNew() />
		
		<cfif NOT $.currentUser().isSuperUser()>
			<cfset local.qSites = $.getBean('settingsManager').getList('orderno') />
			<cfset local.site = $.siteConfig().getSiteId() />
			
			<cfloop query="local.qSites">
				<cfif NOT local.qSites.siteId EQ local.site>
					<cflocation url="#$.createHREF(siteid=local.qSites.siteId)#" addtoken="false" >
				</cfif>
			</cfloop>
		</cfif>
		
	</cffunction>

</cfcomponent>