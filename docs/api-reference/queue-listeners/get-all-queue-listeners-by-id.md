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
  method: get
  path: /queues/{queue_id}/listeners
  name: Get all queue listeners by id

---

# Get all queue listeners by id

<p class="text-lg">
<span class="font-medium">GET</span> /queues/{queue_id}/listeners
</p>

**Returns** all listeners of the queue with  `queue_id`. **Requires** the target 
`queue_id` as a path parameter.

A valid `queue_id` is one that was returned by the 
[queue creation endpoint](/api-reference/queues/create-a-queue.html). 
If no queue with the given `queue_id` can be found, the endpoint returns status `404`.

Use this method if you are only interested in the listeners of a specific queue.

The result may be inconistent as in not update-to-date as results may be cached
for a short period of time.

::: tip Authentication
**The target organization for this request will be determined by the supplied access token.** 

As a prerequisite you need to **[create an account](https://www.discue.io/registration/create-account)** and follow
the onboarding process to also **create an organizatio**n and **an API key**.

See also: [Authentication](/getting-started/#prerequisites).
:::

## Examples
<CodeGroup><CodeGroupItem title="shell">

```shell
curl -X GET http://api.discue.io/v1/queues/{queue_id}/listeners \
  -H 'Accept: application/json' \
  -H 'X-API-KEY: API_KEY'
```

</CodeGroupItem>

<CodeGroupItem title="javascript">

```javascript
const headers = {
  'Accept':'application/json',
  'X-API-KEY':'API_KEY'
}

const response = await fetch('http://api.discue.io/v1/queues/{queue_id}/listeners', {
  method: 'GET',  headers
})

const body = await response.json()
```

</CodeGroupItem>

<CodeGroupItem title="python">

```python
import requests
headers = {
  'Accept': 'application/json',
  'X-API-KEY': 'API_KEY'
}

r = requests.get('http://api.discue.io/v1/queues/{queue_id}/listeners', headers = headers)
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
      "Accept": []string{"application/json"},
      "X-API-KEY": []string{"API_KEY"},
  }

  data := bytes.NewBuffer([]byte{jsonReq})
  req, err := http.NewRequest("GET", "http://api.discue.io/v1/queues/{queue_id}/listeners", data)
  req.Header = headers

  client := &http.Client{}
  resp, err := client.Do(req)
}
```

</CodeGroupItem>

</CodeGroup>

## Parameters 
|Name|In|Type|Required|Description|
|---|---|---|---|---|
|pretty|query|boolean| ❌ |Return the response pretty printed|

## Responses 

::: tip 200 Response
:::

```json
{
  "listeners": [
    {
      "id": "string",
      "name": "string",
      "liveness": {
        "state": "stable",
        "success_count": 1,
        "failure_count": 1
      },
      "messages": {
        "acknowledged_count": 312,
        "missed": [
          "fb445832-50f7-4471-a0a9-d0def6d5951f"
        ],
        "missed_count": 1
      },
      "notify_url": "https://myapp.io/deletion/listener",
      "liveness_url": "https://myapp.io/live"
    }
  ],
  "_links": {
    "self": "https://api.discue.io/queues/180994c-b6b2-4d0e-b7ad-414716e83386/listeners",
    "myapp.io/delete-user-listener-64fae19": {
      "href": "https://api.discue.io/queues/180994c-b6b2-4d0e-b7ad-414716e83386/listeners/0644659f-b47b-4668-86dd-a496cb7fbc76"
    }
  }
}
```

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
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Ok|[GetQueueListenersResponse](#getqueuelistenersresponse)|
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

