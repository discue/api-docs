---
title: discue scheduling and queueing API v0.1.0
language_tabs:
  - shell: curl
  - javascript: JavaScript
  - python: Python
  - go: Go
toc_footers: []
includes: []
api:
  method: put
  path: /api_keys/{api_key_id}
  name: Update an api key by id

---

# Update an api key by id

<p class="text-lg">
<span class="font-medium">PUT</span> /api_keys/{api_key_id}
</p>

**Updates** an api key by id. **Requires** the target 
`api_key_id` as a path parameter.

An API Key can be `disabled` by passing `status: disabled`. By passing `status: enabled`, 
you can ``enable`` the key again. 

Always pass the the whole array of `scopes` you want this key to have. At this moment there is no way
to make incremental updates. Whenever the `scopes` array is passed to the endpoint, the previous `scopes`
array will be overriden.

Protected scopes like `api_clients`, `api_keys` and `subscriptions` cannot be set via 
API.

A valid `api_key_id` is one that was returned by the 
[api key creation endpoint](/api-reference/api-keys/create-an-api-key.html).
If no api key can be found with the given `api_key_id`, the endpoint returns status `404`.

Returns `404` if no api key was found with the given `api_key_id`.

Only mutable properties like `name`, `status`, and `scopes` can be updated.

::: tip Authentication
**The target organization for this request will be determined by the supplied access token.** 

As a prerequisite you need to **[create an account](https://www.discue.io/registration/create-account)** and follow
the onboarding process to also **create an organizatio**n and **an API key**.

See also: [Authentication](/getting-started/#prerequisites).
:::

## Examples
<CodeGroup><CodeGroupItem title="shell">

```shell
curl -X PUT http://api.discue.io/v1/api_keys/{api_key_id} \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'X-API-KEY: API_KEY' \
  -d '{
  "name": "string",
  "status": "disabled",
  "scopes": [
    {
      "resource": "queues",
      "access": "write",
      "targets": [
        "*"
      ]
    },
    {
      "resource": "listeners",
      "access": "write",
      "targets": [
        "_Tzrg1O3jk4_FZTAEThNq"
      ]
    },
    {
      "resource": "messages",
      "access": "read",
      "targets": [
        "*"
      ]
    }
  ]
}' 
```

</CodeGroupItem>

<CodeGroupItem title="javascript">

```javascript
const body = {
  "name": "string",
  "status": "disabled",
  "scopes": [
    {
      "resource": "queues",
      "access": "write",
      "targets": [
        "*"
      ]
    },
    {
      "resource": "listeners",
      "access": "write",
      "targets": [
        "_Tzrg1O3jk4_FZTAEThNq"
      ]
    },
    {
      "resource": "messages",
      "access": "read",
      "targets": [
        "*"
      ]
    }
  ]
}

const headers = {
  'Content-Type':'application/json',
  'Accept':'application/json',
  'X-API-KEY':'API_KEY'
}

const response = await fetch('http://api.discue.io/v1/api_keys/{api_key_id}', {
  method: 'PUT',  body,  headers
})

const body = await response.json()
```

</CodeGroupItem>

<CodeGroupItem title="python">

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'X-API-KEY': 'API_KEY'
}

r = requests.put('http://api.discue.io/v1/api_keys/{api_key_id}', headers = headers)
```

</CodeGroupItem>

<CodeGroupItem title="go">

```go
package main

import (
  "bytes"
  "net/http"
)

func main() {

  headers := map[string][]string{
      "Content-Type": []string{"application/json"},
      "Accept": []string{"application/json"},
      "X-API-KEY": []string{"API_KEY"},
  }

  data := bytes.NewBuffer([]byte{jsonReq})
  req, err := http.NewRequest("PUT", "http://api.discue.io/v1/api_keys/{api_key_id}", data)
  req.Header = headers

  client := &http.Client{}
  resp, err := client.Do(req)
}
```

</CodeGroupItem>

</CodeGroup>

## Body

```json
{
  "name": "string",
  "status": "disabled",
  "scopes": [
    {
      "resource": "queues",
      "access": "write",
      "targets": [
        "*"
      ]
    },
    {
      "resource": "listeners",
      "access": "write",
      "targets": [
        "_Tzrg1O3jk4_FZTAEThNq"
      ]
    },
    {
      "resource": "messages",
      "access": "read",
      "targets": [
        "*"
      ]
    }
  ]
}
```

## Parameters 
|Name|In|Type|Required|Description|
|---|---|---|---|---|
|api_key_id|path|[ResourceId](#schemaresourceid)|✔|Id of the api key|
|pretty|query|boolean| ❌ |Return the response pretty printed|
|body|body|[UpdateApiKeyRequest](#schemaupdateapikeyrequest)| ❌ |none|
|» name|body|[ResourceName](#resourcename)| ❌ |none|
|» status|body|string| ❌ |none|
|» scopes|body|[ApiKeyScope](#apikeyscope)| ❌ |none|
|»» resource|body|string| ❌ |none|
|»» access|body|string| ❌ |none|
|»» targets|body|any| ❌ |none|
|»»» *anonymous*|body|[ResourceId](#resourceid)| ❌ |none|
|»»» *anonymous*|body|string| ❌ |none|

## Enumerated Values

|Parameter|Value|
|---|---|
|» status|disabled|
|» status|enabled|
|»» resource|api_clients|
|»» resource|api_keys|
|»» resource|events|
|»» resource|queues|
|»» resource|listeners|
|»» resource|messages|
|»» resource|schemas|
|»» resource|stats|
|»» resource|subscriptions|
|»» access|read|
|»» access|write|
|»»» *anonymous*|*|

## Responses 

::: tip 400 Response
:::

```json
{
  "title": "Bad Request",
  "status": 400
}
```

::: tip 401 Response
:::

```json
{
  "title": "Unauthorized",
  "status": 401
}
```

::: tip 402 Response
:::

```json
{
  "title": "Payment Required",
  "status": 402
}
```

::: tip 403 Response
:::

```json
{
  "title": "Forbidden",
  "status": 403
}
```

::: tip 404 Response
:::

```json
{
  "title": "Not Found",
  "status": 404
}
```

::: tip 405 Response
:::

```json
{
  "title": "Method Not Allowed",
  "status": 405
}
```

::: tip 406 Response
:::

```json
{
  "title": "Not Acceptable",
  "status": 406
}
```

::: tip 409 Response
:::

```json
{
  "title": "Conflict",
  "status": 409
}
```

::: tip 415 Response
:::

```json
{
  "title": "Unsupported Media Type",
  "status": 415
}
```

::: tip 422 Response
:::

```json
{
  "title": "Unprocessable Entity",
  "status": 422
}
```

::: tip 423 Response
:::

```json
{
  "title": "Locked",
  "status": 423
}
```

::: tip 429 Response
:::

```json
{
  "title": "Too Many Requests",
  "status": 429
}
```

::: tip 500 Response
:::

```json
{
  "title": "Internal Server Error",
  "status": 500
}
```

::: tip 501 Response
:::

```json
{
  "title": "Not Implemented",
  "status": 501
}
```

::: tip 503 Response
:::

```json
{
  "title": "Service Unavailable",
  "status": 503
}
```

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Ok|None|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Bad Request|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|Inline|
|402|[Payment Required](https://tools.ietf.org/html/rfc7231#section-6.5.2)|Payment Required|Inline|
|403|[Forbidden](https://tools.ietf.org/html/rfc7231#section-6.5.3)|Forbidden|Inline|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Not Found|Inline|
|405|[Method Not Allowed](https://tools.ietf.org/html/rfc7231#section-6.5.5)|Method Not Allowed|Inline|
|406|[Not Acceptable](https://tools.ietf.org/html/rfc7231#section-6.5.6)|Not Acceptable|Inline|
|409|[Conflict](https://tools.ietf.org/html/rfc7231#section-6.5.8)|Conflict|Inline|
|415|[Unsupported Media Type](https://tools.ietf.org/html/rfc7231#section-6.5.13)|Unsupported Media Type|Inline|
|422|[Unprocessable Entity](https://tools.ietf.org/html/rfc2518#section-10.3)|Unprocessable Entity|Inline|
|423|[Locked](https://tools.ietf.org/html/rfc2518#section-10.4)|Locked|Inline|
|429|[Too Many Requests](https://tools.ietf.org/html/rfc6585#section-4)|Too Many Requests|Inline|
|500|[Internal Server Error](https://tools.ietf.org/html/rfc7231#section-6.6.1)|Internal Server Error|Inline|
|501|[Not Implemented](https://tools.ietf.org/html/rfc7231#section-6.6.2)|Not Implemented|Inline|
|503|[Service Unavailable](https://tools.ietf.org/html/rfc7231#section-6.6.4)|Service Unavailable|Inline|

---

