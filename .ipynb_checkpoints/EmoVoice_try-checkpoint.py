## USed  EmoVoice https://github.com/yanghaha0908/EmoVoice

####   get teh text  file
with open("./voice_text.txt", "r", encoding="utf-8") as f:
    text = f.read().strip()

model_name = "tts_models/en/ljspeech/tacotron2-DDC" # justa  base model
OUT = "tacotron.wav"
tts = TTS(model_name)


tts.tts_to_file(text=text, file_path=OUT)
print("Saved:", OUT)
