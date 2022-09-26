param subscriptionId string
param name string
param location string
param hostingPlanName string
param serverFarmResourceGroup string
param alwaysOn bool
param use32BitWorkerProcess bool
param ftpsState string
param storageAccountName string
param netFrameworkVersion string
param sku string
param skuCode string
param workerSize string
param workerSizeId string
param numberOfWorkers string

resource name_resource 'Microsoft.Web/sites@2018-11-01' = {
  name: name
  kind: 'functionapp'
  location: location
  tags: {
    'hidden-link: /app-insights-resource-id': '/subscriptions/ece7ed6e-ef1e-4600-8b1c-c92098af9d03/resourceGroups/session19/providers/Microsoft.Insights/components/session19'
  }
  properties: {
    name: name
    siteConfig: {
      appSettings: [
        {
          name: 'FUNCTIONS_EXTENSION_VERSION'
          value: '~4'
        }
        {
          name: 'FUNCTIONS_WORKER_RUNTIME'
          value: 'node'
        }
        {
          name: 'WEBSITE_NODE_DEFAULT_VERSION'
          value: '~16'
        }
        {
          name: 'APPINSIGHTS_INSTRUMENTATIONKEY'
          value: reference('microsoft.insights/components/session19', '2015-05-01').InstrumentationKey
        }
        {
          name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
          value: reference('microsoft.insights/components/session19', '2015-05-01').ConnectionString
        }
        {
          name: 'AzureWebJobsStorage'
          value: 'DefaultEndpointsProtocol=https;AccountName=${storageAccountName};AccountKey=${listKeys(storageAccountName_resource.id, '2019-06-01').keys[0].value};EndpointSuffix=core.windows.net'
        }
        {
          name: 'WEBSITE_CONTENTAZUREFILECONNECTIONSTRING'
          value: 'DefaultEndpointsProtocol=https;AccountName=${storageAccountName};AccountKey=${listKeys(storageAccountName_resource.id, '2019-06-01').keys[0].value};EndpointSuffix=core.windows.net'
        }
        {
          name: 'WEBSITE_CONTENTSHARE'
          value: '${toLower(name)}ae44'
        }
      ]
      cors: {
        allowedOrigins: [
          'https://portal.azure.com'
        ]
      }
      use32BitWorkerProcess: use32BitWorkerProcess
      ftpsState: ftpsState
      netFrameworkVersion: netFrameworkVersion
    }
    serverFarmId: '/subscriptions/${subscriptionId}/resourcegroups/${serverFarmResourceGroup}/providers/Microsoft.Web/serverfarms/${hostingPlanName}'
    clientAffinityEnabled: false
    virtualNetworkSubnetId: null
    httpsOnly: true
  }
  dependsOn: [
    session19
    hostingPlanName_resource

  ]
}

resource hostingPlanName_resource 'Microsoft.Web/serverfarms@2018-11-01' = {
  name: hostingPlanName
  location: location
  kind: ''
  tags: null
  properties: {
    name: hostingPlanName
    workerSize: workerSize
    workerSizeId: workerSizeId
    numberOfWorkers: numberOfWorkers
  }
  sku: {
    tier: sku
    name: skuCode
  }
  dependsOn: []
}

resource session19 'microsoft.insights/components@2020-02-02-preview' = {
  name: 'session19'
  location: 'centralus'
  tags: null
  properties: {
    ApplicationId: name
    Request_Source: 'IbizaWebAppExtensionCreate'
    Flow_Type: 'Redfield'
    Application_Type: 'web'
    WorkspaceResourceId: '/subscriptions/ece7ed6e-ef1e-4600-8b1c-c92098af9d03/resourceGroups/DefaultResourceGroup-CUS/providers/Microsoft.OperationalInsights/workspaces/DefaultWorkspace-ece7ed6e-ef1e-4600-8b1c-c92098af9d03-CUS'
  }
  dependsOn: []
}

resource storageAccountName_resource 'Microsoft.Storage/storageAccounts@2019-06-01' = {
  name: storageAccountName
  location: location
  tags: null
  sku: {
    name: 'Standard_LRS'
  }
  properties: {
    supportsHttpsTrafficOnly: true
    minimumTlsVersion: 'TLS1_2'
  }
}

resource TimerTrigger2 'Microsoft.Web/sites/functions@2022-03-01' = {
  parent: name_resource
  name: 'TimerTrigger2'
  location: 'Central US'
  properties: {
    script_root_path_href: 'https://${name}.azurewebsites.net/admin/vfs/site/wwwroot/TimerTrigger2/'
    script_href: 'https://${name}.azurewebsites.net/admin/vfs/site/wwwroot/TimerTrigger2/index.js'
    config_href: 'https://${name}.azurewebsites.net/admin/vfs/site/wwwroot/TimerTrigger2/function.json'
    test_data_href: 'https://${name}.azurewebsites.net/admin/vfs/data/Functions/sampledata/TimerTrigger2.dat'
    href: 'https://${name}.azurewebsites.net/admin/functions/TimerTrigger2'
    config: {
    }
    language: 'node'
    isDisabled: false
  }
  dependsOn: [
    name_resource
  ]
}
