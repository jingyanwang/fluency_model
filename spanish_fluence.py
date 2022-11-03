from monocleaner.monocleaner import *

model_dir = '/yan/es'

metadata = model_dir + '/metadata.yaml'

file_ = open(metadata)

metadata = yaml.safe_load(file_)


lm_file = model_dir + '/' + metadata["lm_file"]


ff = LMFluencyFilter(
	LMType[metadata["lm_type"]], 
	metadata["language"], 
	None)

stats = LMStats(
	metadata["clean_mean_perp"],
	metadata["clean_stddev_perp"],
	metadata["noisy_mean_perp"],
	metadata["noisy_stddev_perp"])

ff.load(lm_file, stats)


def fluence_scoring(
	sentence,
	):
	try:
		return ff.score(sentence)
	except:
		return None


'''

sentence = u"Más allá de la literalidad de la ley de libertad sexual, que se popularice entre las jóvenes el concepto de que “solo sí es sí” es suficiente para poner en marcha el cambio de paradigma en las relaciones"

fluence_scoring(
	sentence,
	)

'''