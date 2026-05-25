package entity

// Training
type Training struct {
	Type              string            `json:"type"	example:"upper-body"`
	Skills            []string          `json:"skills" example:"["strong", "cardio"]`
	TrainingPlan      TrainingPlan      `json:"trainingPlan"`
	TrainingStructure TrainingStructure `json:"trainingStructure"`
}
