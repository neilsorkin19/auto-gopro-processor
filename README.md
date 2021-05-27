# auto-gopro-processor
Concatenates videos from a GoPro automatically using GPU.

Make sure you have CUDA installed (check by doing `nvcc -V` in CMD), then install [ffmpeg](https://www.ffmpeg.org/).

Overview:
1. Detects the drive on which the GoPro or SD card exists (exits if not detected).
2. Generate a file list for [ffmpeg](https://www.ffmpeg.org/) to concatenate.
3. Use generated list to concatenate all videos.
4. Make a lower quality version of the video to save storage.
5. Delete the file list and the original resolution video.
