param sites_session19_name string = 'session19'
param serverfarms_ASP_session19_bddd_externalid string = '/subscriptions/ece7ed6e-ef1e-4600-8b1c-c92098af9d03/resourceGroups/session19/providers/Microsoft.Web/serverfarms/ASP-session19-bddd'

resource sites_session19_name_resource 'Microsoft.Web/sites@2022-03-01' = {
  name: sites_session19_name
  location: 'Central US'
  tags: {
    'hidden-link: /app-insights-resource-id': '/subscriptions/ece7ed6e-ef1e-4600-8b1c-c92098af9d03/resourceGroups/session19/providers/microsoft.insights/components/session19'
    'hidden-link: /app-insights-instrumentation-key': '3580e635-6de3-41ee-b886-306f3ef3c8ca'
    'hidden-link: /app-insights-conn-string': 'InstrumentationKey=3580e635-6de3-41ee-b886-306f3ef3c8ca;IngestionEndpoint=https://centralus-2.in.applicationinsights.azure.com/;LiveEndpoint=https://centralus.livediagnostics.monitor.azure.com/'
  }
  kind: 'functionapp'
  properties: {
    enabled: true
    hostNameSslStates: [
      {
        name: '${sites_session19_name}.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Standard'
      }
      {
        name: '${sites_session19_name}.scm.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Repository'
      }
    ]
    serverFarmId: serverfarms_ASP_session19_bddd_externalid
    reserved: false
    isXenon: false
    hyperV: false
    vnetRouteAllEnabled: false
    vnetImagePullEnabled: false
    vnetContentShareEnabled: false
    siteConfig: {
      numberOfWorkers: 1
      acrUseManagedIdentityCreds: false
      alwaysOn: false
      http20Enabled: false
      functionAppScaleLimit: 200
      minimumElasticInstanceCount: 0
    }
    scmSiteAlsoStopped: false
    clientAffinityEnabled: false
    clientCertEnabled: false
    clientCertMode: 'Required'
    hostNamesDisabled: false
    customDomainVerificationId: '4A30625CCC32A7D841F2DE2827967F6D926674762531FF8D79B414086EBEB6AE'
    containerSize: 1536
    dailyMemoryTimeQuota: 0
    httpsOnly: true
    redundancyMode: 'None'
    storageAccountRequired: false
    keyVaultReferenceIdentity: 'SystemAssigned'
  }
}

resource sites_session19_name_ftp 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2022-03-01' = {
  parent: sites_session19_name_resource
  name: 'ftp'
  location: 'Central US'
  tags: {
    'hidden-link: /app-insights-resource-id': '/subscriptions/ece7ed6e-ef1e-4600-8b1c-c92098af9d03/resourceGroups/session19/providers/microsoft.insights/components/session19'
    'hidden-link: /app-insights-instrumentation-key': '3580e635-6de3-41ee-b886-306f3ef3c8ca'
    'hidden-link: /app-insights-conn-string': 'InstrumentationKey=3580e635-6de3-41ee-b886-306f3ef3c8ca;IngestionEndpoint=https://centralus-2.in.applicationinsights.azure.com/;LiveEndpoint=https://centralus.livediagnostics.monitor.azure.com/'
  }
  properties: {
    allow: true
  }
}

resource sites_session19_name_scm 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2022-03-01' = {
  parent: sites_session19_name_resource
  name: 'scm'
  location: 'Central US'
  tags: {
    'hidden-link: /app-insights-resource-id': '/subscriptions/ece7ed6e-ef1e-4600-8b1c-c92098af9d03/resourceGroups/session19/providers/microsoft.insights/components/session19'
    'hidden-link: /app-insights-instrumentation-key': '3580e635-6de3-41ee-b886-306f3ef3c8ca'
    'hidden-link: /app-insights-conn-string': 'InstrumentationKey=3580e635-6de3-41ee-b886-306f3ef3c8ca;IngestionEndpoint=https://centralus-2.in.applicationinsights.azure.com/;LiveEndpoint=https://centralus.livediagnostics.monitor.azure.com/'
  }
  properties: {
    allow: true
  }
}

resource sites_session19_name_web 'Microsoft.Web/sites/config@2022-03-01' = {
  parent: sites_session19_name_resource
  name: 'web'
  location: 'Central US'
  tags: {
    'hidden-link: /app-insights-resource-id': '/subscriptions/ece7ed6e-ef1e-4600-8b1c-c92098af9d03/resourceGroups/session19/providers/microsoft.insights/components/session19'
    'hidden-link: /app-insights-instrumentation-key': '3580e635-6de3-41ee-b886-306f3ef3c8ca'
    'hidden-link: /app-insights-conn-string': 'InstrumentationKey=3580e635-6de3-41ee-b886-306f3ef3c8ca;IngestionEndpoint=https://centralus-2.in.applicationinsights.azure.com/;LiveEndpoint=https://centralus.livediagnostics.monitor.azure.com/'
  }
  properties: {
    numberOfWorkers: 1
    defaultDocuments: [
      'Default.htm'
      'Default.html'
      'Default.asp'
      'index.htm'
      'index.html'
      'iisstart.htm'
      'default.aspx'
      'index.php'
    ]
    netFrameworkVersion: 'v6.0'
    requestTracingEnabled: false
    remoteDebuggingEnabled: false
    httpLoggingEnabled: false
    acrUseManagedIdentityCreds: false
    logsDirectorySizeLimit: 35
    detailedErrorLoggingEnabled: false
    publishingUsername: '$session19'
    scmType: 'None'
    use32BitWorkerProcess: true
    webSocketsEnabled: false
    alwaysOn: false
    managedPipelineMode: 'Integrated'
    virtualApplications: [
      {
        virtualPath: '/'
        physicalPath: 'site\\wwwroot'
        preloadEnabled: false
      }
    ]
    loadBalancing: 'LeastRequests'
    experiments: {
      rampUpRules: []
    }
    autoHealEnabled: false
    vnetRouteAllEnabled: false
    vnetPrivatePortsCount: 0
    cors: {
      allowedOrigins: [
        'https://portal.azure.com'
      ]
      supportCredentials: false
    }
    localMySqlEnabled: false
    ipSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 2147483647
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 2147483647
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictionsUseMain: false
    http20Enabled: false
    minTlsVersion: '1.2'
    scmMinTlsVersion: '1.2'
    ftpsState: 'FtpsOnly'
    preWarmedInstanceCount: 0
    functionAppScaleLimit: 200
    functionsRuntimeScaleMonitoringEnabled: false
    minimumElasticInstanceCount: 0
    azureStorageAccounts: {
    }
  }
}

resource sites_session19_name_TimerTrigger2 'Microsoft.Web/sites/functions@2022-03-01' = {
  parent: sites_session19_name_resource
  name: 'TimerTrigger2'
  location: 'Central US'
  properties: {
    script_root_path_href: 'https://session19.azurewebsites.net/admin/vfs/site/wwwroot/TimerTrigger2/'
    script_href: 'https://session19.azurewebsites.net/admin/vfs/site/wwwroot/TimerTrigger2/index.js'
    config_href: 'https://session19.azurewebsites.net/admin/vfs/site/wwwroot/TimerTrigger2/function.json'
    test_data_href: 'https://session19.azurewebsites.net/admin/vfs/data/Functions/sampledata/TimerTrigger2.dat'
    href: 'https://session19.azurewebsites.net/admin/functions/TimerTrigger2'
    config: {
    }
    language: 'node'
    isDisabled: false
  }
}

resource sites_session19_name_sites_session19_name_azurewebsites_net 'Microsoft.Web/sites/hostNameBindings@2022-03-01' = {
  parent: sites_session19_name_resource
  name: '${sites_session19_name}.azurewebsites.net'
  location: 'Central US'
  properties: {
    siteName: 'session19'
    hostNameType: 'Verified'
  }
}