package entity

import (
	"time"

	"github.com/gofrs/uuid/v5"
)

// TrainingPlanHistory
type TrainingPlanHistory struct {
	ID        uuid.UUID
	PlanID    uuid.UUID
	CreatedAt time.Time
}
