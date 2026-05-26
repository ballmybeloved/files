# OBS Settings

## OBS `Settings -> Output` tab


### Streaming settings:

**Everything default except:**

* Video encoder: AV1, or H.265/HEVC if you don't have it, or H.264 if your specs are bad
* Bitrate: 6000

--------------------------------------

### Recording settings:

**Everything default except:**

* Video encoder: AV1
* Rate control: Variable Bitrate with Target


--------------------------------------

## OBS `Settings -> Video` tab

### Video settings:

Base (Canvas) Resolution: whatever resolution your monitor is
Output (Canvas) Resolution: what you want the output to be. some people downscale from 4k/1440p to 1080p

Common FPS Values: 60

--------------------------------------

# Davinci Render Settings

Format: MP4
Codec: AV1, or H.265 if you don't have AV1
Frame rate: 60
Quality: Restrict to: 10000kbps
Encoding profile: Main. Main10 if recording in HDR