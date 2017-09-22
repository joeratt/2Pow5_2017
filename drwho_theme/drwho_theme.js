/* Simple JS to steam and play an MP3 file
 * A JS Submission to cerner_2^5_2017
 */
function Start() {
  myAudio = document.createElement('audio');
  // Dr. Who is © BBC, Dr. Who Theme Song is © BBC
  myAudio.setAttribute('src','http://www.drwhoguide.com/mp3/who11.mp3');
  myAudio.play();
}

// Start the sweet tunes!
document.onload = Start();
