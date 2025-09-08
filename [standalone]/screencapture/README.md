# ScreenCapture

ScreenCapture is a resource being built as a replacement for screenshot-basic in FiveM.

## Why build something new?

I'll explain this later, but briefly - Screenshot-Basic is no longer maintained, has it's issues. It's a nightmare for almost everyone to get up and running for some reason (blame FXServer yarn) and it's not up-to-date with anything.

## How to use

You can use the server-side exports, or the `screenshot-basic` backwards compatiable client-export: `requestScreenshotUpload`.

### JavaScript / TypeScript

Converting Base64 to Blob/Buffer is easy enough with Node, but Lua ScRT in FiveM doesn't really offer that functionality, so if you wish to use the `serverCapture` export, you'll need to use Base64. More on that later.

### serverCapture (server-side export)

| Parameter  | Type                     | Description                                                               |
| ---------- | ------------------------ | ------------------------------------------------------------------------- |
| `source`   | string                   | Player to capture                                                         |
| `options`  | object/table             | Configuration options for the capture                                     |
| `callback` | function                 | A function invoked with the captured data                                 |
| `dataType` | string (default: base64) | What data should be returned through the callback: `'base64'` or `'blob'` |

#### Options

The `options` argument accepts an object with the following fields:

| Field       | Type           | Default  | Description                                                               |
| ----------- | -------------- | -------- | ------------------------------------------------------------------------- |
| `headers`   | `object/table` | `null`   | Optional HTTP headers to include in the capture request.                  |
| `formField` | `string`       | `null`   | The form field name to be used when uploading the captured data.          |
| `filename`  | `string`       | `null`   | Specifies the name of the file when saving or transmitting captured data. |
| `encoding`  | `string`       | `'webp'` | Specifies the encoding format for the captured image (e.g., `'webp'`).    |

```ts
RegisterCommand(
  'capture',
  (_: string, args: string[]) => {
    exp.screencapture.serverCapture(
      args[0],
      { encoding: 'webp' },
      (data: string | Buffer<ArrayBuffer>) => {
        data = Buffer.from(data as ArrayBuffer);

        fs.writeFileSync('./blob_image.webp', data);
        console.log(`File saved`);
      },
      'blob',
    );
  },
  false,
);
```

### remoteUpload (server-side export)

| Parameter  | Type                     | Description                                                              |
| ---------- | ------------------------ | ------------------------------------------------------------------------ |
| `source`   | string                   | Player to capture                                                        |
| `url`      | string                   | The upload URL                                                           |
| `options`  | object/table             | Configuration options for the capture                                    |
| `callback` | function                 | Callback returning the HTTP response in JSON                             |
| `dataType` | string (default: base64) | What data type should be used to upload the file: `'base64'` or `'blob'` |

#### Options

The `options` argument accepts an object with the following fields:

| Field       | Type           | Default  | Description                                                               |
| ----------- | -------------- | -------- | ------------------------------------------------------------------------- |
| `headers`   | `object/table` | `null`   | Optional HTTP headers to include in the capture request.                  |
| `formField` | `string`       | `null`   | The form field name to be used when uploading the captured data.          |
| `filename`  | `string`       | `null`   | Specifies the name of the file when saving or transmitting captured data. |
| `encoding`  | `string`       | `'webp'` | Specifies the encoding format for the captured image (e.g., `'webp'`).    |

```ts
RegisterCommand(
  'remoteCapture',
  (_: string, args: string[]) => {
    exp.screencapture.remoteUpload(
      args[0],
      'https://api.fivemanage.com/api/image',
      {
        encoding: 'webp',
        headers: {
          Authorization: '',
        },
      },
      (data: any) => {
        console.log(data);
      },
      'blob',
    );
  },
  false,
);
```

## Lua example with `remoteUpload`

```lua
exports.screencapture:remoteUpload(args[1], "https://api.fivemanage.com/api/image", {
    encoding = "webp",
    headers = {
        ["Authorization"] = ""
    }
}, function(data)
    print(data.url)
end, "blob")
```

## High-Resolution Display Optimization

For users with 4K, ultrawide, or other high-resolution displays, you can customize the maximum screenshot resolution to balance quality and payload size:

```lua
-- Allow higher resolution for better quality (may increase upload time)
exports.screencapture:remoteUpload(args[1], "https://api.fivemanage.com/api/image", {
    encoding = "webp",
    maxWidth = 2560,
    maxHeight = 1440,
    headers = {
        ["Authorization"] = ""
    }
}, function(data)
    print(data.url)
end, "blob")

-- Use lower resolution for faster uploads
exports.screencapture:remoteUpload(args[1], "https://api.fivemanage.com/api/image", {
    encoding = "webp",
    maxWidth = 1280,
    maxHeight = 720,
    headers = {
        ["Authorization"] = ""
    }
}, function(data)
    print(data.url)
end, "blob")
```

## Screenshot Basic compatibility



### requestScreenshotUpload (client-side export)
#### This is NOT recommended to use, as you risk exposing tokens to clients.

```lua
exports['screencapture']:requestScreenshotUpload('https://api.fivemanage.com/api/image', 'file', {
    headers = {
        ["Authorization"] = API_TOKEN
    },
    encoding = "webp"
}, function(data)
    local resp = json.decode(data)
    print(resp.url);
    TriggerEvent('chat:addMessage', { template = '<img src="{0}" style="max-width: 300px;" />', args = { resp.url } })
end)
```

### requestScreenshot (client-side export)

This export returns a base64 data URI of the screenshot, similar to screenshot-basic. It does not upload the image, but provides the raw image data to your callback.

```lua
exports['screencapture']:requestScreenshot({ encoding = 'jpg' }, function(data)
    -- 'data' is a base64-encoded image string (data URI)
    print(data)
    -- You can use the data URI directly in HTML or upload it manually
end)
```

## What will this include?

1. Server exports both for getting image data and uploading images/videos from the server
2. Client exports (maybe)
3. Upload images or videos from NUI, just more secure.
4. React, Svelt and Vue packages + publishing all internal packages like @screencapture/gameview (SoonTM)
