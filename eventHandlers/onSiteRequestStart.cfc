<!---

disableSite/eventHandlers/onSiteRequestStart.cfm

Copyright 2011 Guust Nieuwenhuis 

Licensed under the Apache License, Version 2.0 (the "License"); 
you may not use this file except in compliance with the License. 
You may obtain a copy of the License at 

http://www.apache.org/licenses/LICENSE-2.0 

Unless required by applicable law or agreed to in writing, software 
distributed under the License is distributed on an "AS IS" BASIS, 
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
See the License for the specific language governing permissions and 
limitations under the License. 

--->

<cfcomponent extends="mura.plugin.pluginGenericEventHandler">

	<cffunction name="onSiteRequestStart" access="public" returntype="void" output="false">
		<cfargument name="$" />
		
		<cfset var local = StructNew() />
		
		<cfif NOT $.currentUser().isSuperUser()>
			<cfset local.qSites = $.getBean('settingsManager').getList('orderno') />
			<cfset local.site = $.siteConfig().getSiteId() />
			
			<cfloop query="local.qSites">
				<cfif NOT local.qSites.siteId EQ local.site>
					<cflocation url="#$.createHREF(filename='', siteid=local.qSites.siteId, complete=true)#" addtoken="false" >
				</cfif>
			</cfloop>
		</cfif>
		
	</cffunction>

</cfcomponent>