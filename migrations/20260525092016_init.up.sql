CREATE TABLE IF NOT EXISTS training_structure (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    structure TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS exercises (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    muscle_group TEXT[],
    description TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS training (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS training_plan (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    plan TEXT,
    train_id UUID NOT NULL REFERENCES training(id),
    accent VARCHAR(50),
    skills TEXT[],
    training_structure_id UUID NOT NULL REFERENCES training_structure(id),
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS training_exercises (
    training_id UUID REFERENCES training(id),
    exercise_id UUID REFERENCES exercises(id),
    PRIMARY KEY (training_id, exercise_id)
);

CREATE TABLE training_plan_history (
    id UUID NOT NULL DEFAULT gen_random_uuid(),
    plan_id UUID NOT NULL,
    action TEXT NOT NULL, 
    snapshot JSONB NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
) PARTITION BY RANGE (created_at);

CREATE TABLE training_plan_history_2026_01
    PARTITION OF training_plan_history
    FOR VALUES FROM ('2026-01-01') TO ('2026-02-01');
