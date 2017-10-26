from langdetect import detect

class LangDetection:
	def detect_locale(self, originLocale):
		return detect(originLocale)