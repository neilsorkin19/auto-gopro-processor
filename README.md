# auto-gopro-processor
Concatenates videos from a GoPro automatically using GPU.

Make sure you have CUDA installed (check by doing `nvcc -V` in CMD), then install [ffmpeg](https://www.ffmpeg.org/).

Overview:
1. Detects the drive on which the GoPro or SD card exists (exits if not detected).
2. Generate a file list for [ffmpeg](https://www.ffmpeg.org/) to concatenate.
3. Use generated list to concatenate all videos.
4. Make a lower quality version of the video to save storage.
5. Delete the file list and the original resolution video.

Usage:
1. Place `concat.bat` in your destination folder (the folder where the final video should be exported to).
2. Run `concat.bat`.
3. Enter an output name.
4. Wait for the processing to finish.

For 1 hour of 4K 30 FPS footage, the whole process takes me about 35 minutes. My specs: GTX 1060 6GB, 16GB RAM, and i7-8750H CPU @ 2.20GHz.
