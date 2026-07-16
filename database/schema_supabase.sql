-- ============================================================================
-- Engineering College Admission Platform - PostgreSQL Schema
-- Version: 1.0
-- Database: engineering_admissions
-- ============================================================================

-- Enable required extensions
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pg_trgm";

-- ============================================================================
-- 1. COUNSELLING SYSTEMS TABLE
-- ============================================================================

CREATE TABLE counselling_systems (
    counselling_system_id SERIAL PRIMARY KEY,
    system_code VARCHAR(20) UNIQUE NOT NULL,
    system_name VARCHAR(100) NOT NULL,
    state VARCHAR(50),
    country VARCHAR(50) DEFAULT 'India',
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_counselling_system_code ON counselling_systems(system_code);
CREATE INDEX idx_counselling_system_active ON counselling_systems(is_active);

-- ============================================================================
-- 2. GEOGRAPHIC HIERARCHY TABLES
-- ============================================================================

CREATE TABLE districts (
    district_id SERIAL PRIMARY KEY,
    district_name VARCHAR(100) NOT NULL,
    state VARCHAR(50) NOT NULL,
    country VARCHAR(50) DEFAULT 'India',
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE UNIQUE INDEX idx_district_name_state ON districts(district_name, state);
CREATE INDEX idx_district_active ON districts(is_active);

-- ============================================================================

CREATE TABLE taluks (
    taluk_id SERIAL PRIMARY KEY,
    taluk_name VARCHAR(100) NOT NULL,
    district_id INTEGER NOT NULL,
    state VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_taluk_district FOREIGN KEY (district_id) 
        REFERENCES districts(district_id) ON DELETE RESTRICT
);

CREATE UNIQUE INDEX idx_taluk_district ON taluks(taluk_name, district_id);
CREATE INDEX idx_taluk_district_fk ON taluks(district_id);

-- ============================================================================
-- 3. BRANCH MASTER TABLE
-- ============================================================================

CREATE TABLE branch_masters (
    branch_id SERIAL PRIMARY KEY,
    branch_code VARCHAR(10) UNIQUE NOT NULL,
    branch_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    description TEXT,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_branch_code ON branch_masters(branch_code);
CREATE INDEX idx_branch_category ON branch_masters(category);
CREATE INDEX idx_branch_active ON branch_masters(is_active);

-- ============================================================================
-- 4. COLLEGES TABLE (CORE)
-- ============================================================================

CREATE TABLE colleges (
    college_id SERIAL PRIMARY KEY,
    counselling_system_id INTEGER NOT NULL,
    college_code VARCHAR(20) NOT NULL,
    college_name VARCHAR(255) NOT NULL,
    principal_dean VARCHAR(100),
    autonomous_status BOOLEAN DEFAULT FALSE,
    minority_status BOOLEAN DEFAULT FALSE,
    bank_name VARCHAR(100),
    website VARCHAR(255),
    email VARCHAR(100),
    phone VARCHAR(20),
    fax VARCHAR(20),
    alternate_phone VARCHAR(20),
    address TEXT,
    pincode VARCHAR(10),
    district_id INTEGER,
    taluk_id INTEGER,
    distance_from_hq DECIMAL(8,2),
    nearest_railway_station VARCHAR(100),
    distance_from_railway DECIMAL(8,2),
    data_completeness VARCHAR(20) DEFAULT 'complete',
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_college_counselling_system FOREIGN KEY (counselling_system_id) 
        REFERENCES counselling_systems(counselling_system_id) ON DELETE RESTRICT,
    CONSTRAINT fk_college_district FOREIGN KEY (district_id) 
        REFERENCES districts(district_id) ON DELETE SET NULL,
    CONSTRAINT fk_college_taluk FOREIGN KEY (taluk_id) 
        REFERENCES taluks(taluk_id) ON DELETE SET NULL,
    CONSTRAINT ck_distance_hq CHECK (distance_from_hq >= 0),
    CONSTRAINT ck_distance_railway CHECK (distance_from_railway >= 0)
);

CREATE UNIQUE INDEX idx_college_system_code ON colleges(counselling_system_id, college_code);
CREATE INDEX idx_college_district ON colleges(district_id);
CREATE INDEX idx_college_taluk ON colleges(taluk_id);
CREATE INDEX idx_college_counselling_system ON colleges(counselling_system_id);
CREATE INDEX idx_college_autonomous ON colleges(autonomous_status) WHERE is_active = TRUE;
CREATE INDEX idx_college_minority ON colleges(minority_status) WHERE is_active = TRUE;
CREATE INDEX idx_college_active ON colleges(is_active);
CREATE INDEX idx_college_name_fts ON colleges USING GIN(to_tsvector('english', college_name));

-- ============================================================================
-- 5. COLLEGE BRANCHES TABLE
-- ============================================================================

CREATE TABLE college_branches (
    college_branch_id SERIAL PRIMARY KEY,
    college_id INTEGER NOT NULL,
    branch_id INTEGER NOT NULL,
    intake INTEGER NOT NULL,
    year_started INTEGER,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_college_branch_college FOREIGN KEY (college_id) 
        REFERENCES colleges(college_id) ON DELETE CASCADE,
    CONSTRAINT fk_college_branch_branch FOREIGN KEY (branch_id) 
        REFERENCES branch_masters(branch_id) ON DELETE RESTRICT,
    CONSTRAINT ck_intake_positive CHECK (intake > 0),
    CONSTRAINT ck_year_started CHECK (year_started >= 1850 AND year_started <= EXTRACT(YEAR FROM CURRENT_DATE))
);

CREATE UNIQUE INDEX idx_college_branch_pair ON college_branches(college_id, branch_id);
CREATE INDEX idx_college_branch_college ON college_branches(college_id);
CREATE INDEX idx_college_branch_branch ON college_branches(branch_id);
CREATE INDEX idx_college_branch_active ON college_branches(college_id, is_active);

-- ============================================================================
-- 6. BRANCH ACCREDITATIONS TABLE
-- ============================================================================

CREATE TABLE branch_accreditations (
    accreditation_id SERIAL PRIMARY KEY,
    college_branch_id INTEGER NOT NULL,
    accreditation_type VARCHAR(50) NOT NULL,
    is_accredited BOOLEAN NOT NULL,
    valid_from DATE,
    valid_upto DATE,
    accreditation_body VARCHAR(100),
    grade VARCHAR(10),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_accreditation_college_branch FOREIGN KEY (college_branch_id) 
        REFERENCES college_branches(college_branch_id) ON DELETE CASCADE,
    CONSTRAINT ck_valid_dates CHECK (valid_from IS NULL OR valid_upto IS NULL OR valid_from <= valid_upto)
);

CREATE INDEX idx_accreditation_college_branch ON branch_accreditations(college_branch_id);
CREATE INDEX idx_accreditation_type ON branch_accreditations(accreditation_type);
CREATE INDEX idx_accreditation_valid_upto ON branch_accreditations(valid_upto);
CREATE INDEX idx_accreditation_status ON branch_accreditations(college_branch_id, accreditation_type, is_accredited);

-- ============================================================================
-- 7. HOSTEL FACILITIES TABLE
-- ============================================================================

CREATE TABLE hostel_facilities (
    hostel_facility_id SERIAL PRIMARY KEY,
    college_id INTEGER NOT NULL,
    gender VARCHAR(10) NOT NULL,
    accommodation_available BOOLEAN NOT NULL,
    accommodation_type VARCHAR(50),
    mess_type VARCHAR(50),
    mess_bill_monthly DECIMAL(10,2),
    room_rent_monthly DECIMAL(10,2),
    electricity_charges_monthly DECIMAL(10,2),
    caution_deposit DECIMAL(10,2),
    establishment_charges DECIMAL(10,2),
    admission_fees DECIMAL(10,2),
    transport_facilities_available BOOLEAN DEFAULT FALSE,
    min_transport_charges DECIMAL(10,2) DEFAULT 0,
    max_transport_charges DECIMAL(10,2) DEFAULT 0,
    total_beds_available INTEGER,
    occupancy_rate DECIMAL(5,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_hostel_college FOREIGN KEY (college_id) 
        REFERENCES colleges(college_id) ON DELETE CASCADE,
    CONSTRAINT ck_gender CHECK (gender IN ('Boys', 'Girls', 'Co-ed')),
    CONSTRAINT ck_accommodation_type CHECK (accommodation_type IS NULL OR accommodation_type IN ('Permanent', 'Rental')),
    CONSTRAINT ck_mess_type CHECK (mess_type IS NULL OR mess_type IN ('Veg', 'Non-Veg', 'Both')),
    CONSTRAINT ck_charges_positive CHECK (
        mess_bill_monthly >= 0 AND 
        room_rent_monthly >= 0 AND 
        electricity_charges_monthly >= 0 AND
        caution_deposit >= 0 AND
        establishment_charges >= 0 AND
        admission_fees >= 0 AND
        min_transport_charges >= 0 AND
        max_transport_charges >= 0
    ),
    CONSTRAINT ck_occupancy_range CHECK (occupancy_rate IS NULL OR (occupancy_rate >= 0 AND occupancy_rate <= 100))
);

CREATE UNIQUE INDEX idx_hostel_college_gender ON hostel_facilities(college_id, gender);
CREATE INDEX idx_hostel_college ON hostel_facilities(college_id);
CREATE INDEX idx_hostel_accommodation ON hostel_facilities(accommodation_available);
CREATE INDEX idx_hostel_transport ON hostel_facilities(transport_facilities_available);
CREATE INDEX idx_hostel_gender ON hostel_facilities(gender);

-- ============================================================================
-- 8. COLLEGE FACILITIES TABLE
-- ============================================================================

CREATE TABLE college_facilities (
    facility_id SERIAL PRIMARY KEY,
    college_id INTEGER NOT NULL,
    facility_name VARCHAR(100) NOT NULL,
    facility_type VARCHAR(50) NOT NULL,
    description TEXT,
    is_available BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_facility_college FOREIGN KEY (college_id) 
        REFERENCES colleges(college_id) ON DELETE CASCADE
);

CREATE INDEX idx_facility_college ON college_facilities(college_id);
CREATE INDEX idx_facility_type ON college_facilities(facility_type);
CREATE INDEX idx_facility_available ON college_facilities(is_available);

-- ============================================================================
-- 9. COLLEGE CONTACTS TABLE
-- ============================================================================

CREATE TABLE college_contacts (
    contact_id SERIAL PRIMARY KEY,
    college_id INTEGER NOT NULL,
    contact_type VARCHAR(50) NOT NULL,
    contact_name VARCHAR(100) NOT NULL,
    designation VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    department VARCHAR(100),
    is_primary BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_contact_college FOREIGN KEY (college_id) 
        REFERENCES colleges(college_id) ON DELETE CASCADE
);

CREATE INDEX idx_contact_college ON college_contacts(college_id);
CREATE INDEX idx_contact_type ON college_contacts(contact_type);
CREATE INDEX idx_contact_primary ON college_contacts(college_id, is_primary);

-- ============================================================================
-- 10. COLLEGE IMAGES TABLE
-- ============================================================================

CREATE TABLE college_images (
    image_id SERIAL PRIMARY KEY,
    college_id INTEGER NOT NULL,
    image_url VARCHAR(500) NOT NULL,
    image_type VARCHAR(50),
    caption VARCHAR(255),
    display_order INTEGER,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_image_college FOREIGN KEY (college_id) 
        REFERENCES colleges(college_id) ON DELETE CASCADE
);

CREATE INDEX idx_image_college ON college_images(college_id);
CREATE INDEX idx_image_type ON college_images(image_type);
CREATE INDEX idx_image_active ON college_images(is_active);

-- ============================================================================
-- 11. AUDIT TABLE
-- ============================================================================

CREATE TABLE college_audit (
    audit_id SERIAL PRIMARY KEY,
    table_name VARCHAR(50) NOT NULL,
    record_id INTEGER NOT NULL,
    action VARCHAR(10) NOT NULL,
    old_values JSONB,
    new_values JSONB,
    changed_by VARCHAR(100),
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_audit_table_record ON college_audit(table_name, record_id);
CREATE INDEX idx_audit_timestamp ON college_audit(changed_at);

-- ============================================================================
-- 12. AUDIT TRIGGER FUNCTION
-- ============================================================================

CREATE OR REPLACE FUNCTION audit_trigger_func()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO college_audit (table_name, record_id, action, old_values, new_values, changed_by)
    VALUES (
        TG_TABLE_NAME,
        COALESCE(NEW.college_id, OLD.college_id),
        TG_OP,
        CASE WHEN TG_OP = 'DELETE' THEN row_to_json(OLD) ELSE NULL END,
        CASE WHEN TG_OP IN ('INSERT', 'UPDATE') THEN row_to_json(NEW) ELSE NULL END,
        current_user
    );
    RETURN COALESCE(NEW, OLD);
END;
$$ LANGUAGE plpgsql;

-- Create audit triggers for main tables
CREATE TRIGGER audit_colleges AFTER INSERT OR UPDATE OR DELETE ON colleges
    FOR EACH ROW EXECUTE FUNCTION audit_trigger_func();

CREATE TRIGGER audit_college_branches AFTER INSERT OR UPDATE OR DELETE ON college_branches
    FOR EACH ROW EXECUTE FUNCTION audit_trigger_func();

CREATE TRIGGER audit_hostel_facilities AFTER INSERT OR UPDATE OR DELETE ON hostel_facilities
    FOR EACH ROW EXECUTE FUNCTION audit_trigger_func();

-- ============================================================================
-- 13. VIEWS FOR COMMON QUERIES
-- ============================================================================

-- View: Colleges with all details
CREATE OR REPLACE VIEW v_colleges_with_details AS
SELECT 
    c.college_id,
    c.college_code,
    c.college_name,
    c.autonomous_status,
    c.minority_status,
    d.district_name,
    t.taluk_name,
    cs.system_name,
    c.website,
    c.email,
    c.phone,
    COUNT(DISTINCT cb.college_branch_id) as total_branches,
    COUNT(DISTINCT CASE WHEN ba.is_accredited = TRUE THEN ba.accreditation_id END) as accredited_branches,
    COUNT(DISTINCT CASE WHEN hf.accommodation_available = TRUE THEN hf.hostel_facility_id END) as hostel_types_available
FROM colleges c
LEFT JOIN districts d ON c.district_id = d.district_id
LEFT JOIN taluks t ON c.taluk_id = t.taluk_id
LEFT JOIN counselling_systems cs ON c.counselling_system_id = cs.counselling_system_id
LEFT JOIN college_branches cb ON c.college_id = cb.college_id
LEFT JOIN branch_accreditations ba ON cb.college_branch_id = ba.college_branch_id
LEFT JOIN hostel_facilities hf ON c.college_id = hf.college_id
WHERE c.is_active = TRUE
GROUP BY c.college_id, c.college_code, c.college_name, c.autonomous_status, 
         c.minority_status, d.district_name, t.taluk_name, cs.system_name, 
         c.website, c.email, c.phone;

-- View: Colleges by branch offering
CREATE OR REPLACE VIEW v_colleges_by_branch AS
SELECT 
    bm.branch_code,
    bm.branch_name,
    c.college_id,
    c.college_name,
    cb.intake,
    cb.year_started,
    ba.is_accredited,
    ba.valid_upto,
    d.district_name
FROM college_branches cb
JOIN colleges c ON cb.college_id = c.college_id
JOIN branch_masters bm ON cb.branch_id = bm.branch_id
LEFT JOIN districts d ON c.district_id = d.district_id
LEFT JOIN branch_accreditations ba ON cb.college_branch_id = ba.college_branch_id 
    AND ba.accreditation_type = 'NBA'
WHERE c.is_active = TRUE AND cb.is_active = TRUE;

-- View: Colleges with hostel facilities
CREATE OR REPLACE VIEW v_colleges_with_hostels AS
SELECT 
    c.college_id,
    c.college_name,
    hf.gender,
    hf.accommodation_available,
    hf.accommodation_type,
    hf.mess_type,
    hf.mess_bill_monthly,
    hf.room_rent_monthly,
    hf.electricity_charges_monthly,
    (hf.mess_bill_monthly + hf.room_rent_monthly + hf.electricity_charges_monthly) as monthly_total,
    hf.transport_facilities_available,
    hf.min_transport_charges,
    hf.max_transport_charges,
    d.district_name
FROM colleges c
JOIN hostel_facilities hf ON c.college_id = hf.college_id
LEFT JOIN districts d ON c.district_id = d.district_id
WHERE c.is_active = TRUE;

-- ============================================================================
-- 14. MATERIALIZED VIEW FOR PERFORMANCE
-- ============================================================================

CREATE MATERIALIZED VIEW mv_college_search_index AS
SELECT 
    c.college_id,
    c.college_code,
    c.college_name,
    c.autonomous_status,
    c.minority_status,
    d.district_name,
    STRING_AGG(DISTINCT bm.branch_code, ', ') as branch_codes,
    STRING_AGG(DISTINCT bm.branch_name, ', ') as branch_names,
    COUNT(DISTINCT cb.college_branch_id) as total_branches,
    MAX(CASE WHEN hf.accommodation_available = TRUE THEN 1 ELSE 0 END) as has_hostel,
    cs.system_name
FROM colleges c
LEFT JOIN districts d ON c.district_id = d.district_id
LEFT JOIN college_branches cb ON c.college_id = cb.college_id
LEFT JOIN branch_masters bm ON cb.branch_id = bm.branch_id
LEFT JOIN hostel_facilities hf ON c.college_id = hf.college_id
LEFT JOIN counselling_systems cs ON c.counselling_system_id = cs.counselling_system_id
WHERE c.is_active = TRUE
GROUP BY c.college_id, c.college_code, c.college_name, c.autonomous_status, 
         c.minority_status, d.district_name, cs.system_name;

CREATE INDEX idx_mv_college_search_name ON mv_college_search_index 
    USING GIN(to_tsvector('english', college_name));

-- ============================================================================
-- 15. STORED PROCEDURES
-- ============================================================================

-- Procedure: Get colleges offering a specific branch
CREATE OR REPLACE FUNCTION get_colleges_by_branch(p_branch_code VARCHAR)
RETURNS TABLE (
    college_id INTEGER,
    college_name VARCHAR,
    branch_code VARCHAR,
    intake INTEGER,
    district_name VARCHAR,
    is_accredited BOOLEAN
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        c.college_id,
        c.college_name,
        bm.branch_code,
        cb.intake,
        d.district_name,
        COALESCE(ba.is_accredited, FALSE)
    FROM colleges c
    JOIN college_branches cb ON c.college_id = cb.college_id
    JOIN branch_masters bm ON cb.branch_id = bm.branch_id
    LEFT JOIN districts d ON c.district_id = d.district_id
    LEFT JOIN branch_accreditations ba ON cb.college_branch_id = ba.college_branch_id 
        AND ba.accreditation_type = 'NBA'
    WHERE bm.branch_code = p_branch_code 
        AND c.is_active = TRUE 
        AND cb.is_active = TRUE
    ORDER BY c.college_name;
END;
$$ LANGUAGE plpgsql;

-- Procedure: Get colleges in a district with hostel
CREATE OR REPLACE FUNCTION get_colleges_with_hostel(p_district_name VARCHAR, p_gender VARCHAR)
RETURNS TABLE (
    college_id INTEGER,
    college_name VARCHAR,
    district_name VARCHAR,
    monthly_cost DECIMAL
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        c.college_id,
        c.college_name,
        d.district_name,
        (hf.mess_bill_monthly + hf.room_rent_monthly + hf.electricity_charges_monthly)
    FROM colleges c
    JOIN hostel_facilities hf ON c.college_id = hf.college_id
    JOIN districts d ON c.district_id = d.district_id
    WHERE d.district_name = p_district_name 
        AND hf.gender = p_gender 
        AND hf.accommodation_available = TRUE
        AND c.is_active = TRUE
    ORDER BY c.college_name;
END;
$$ LANGUAGE plpgsql;

-- Procedure: Refresh materialized view
CREATE OR REPLACE FUNCTION refresh_college_search_index()
RETURNS void AS $$
BEGIN
    REFRESH MATERIALIZED VIEW CONCURRENTLY mv_college_search_index;
END;
$$ LANGUAGE plpgsql;

-- ============================================================================
-- 16. INITIAL DATA LOAD
-- ============================================================================

-- Insert counselling systems
INSERT INTO counselling_systems (system_code, system_name, state) VALUES
    ('TNEA', 'Tamil Nadu Engineering Admissions', 'Tamil Nadu'),
    ('JOSAA', 'Joint Seat Allocation Authority', 'All India'),
    ('KCET', 'Karnataka Common Entrance Test', 'Karnataka'),
    ('MHT_CET', 'Maharashtra Health and Technical Common Entrance Test', 'Maharashtra'),
    ('AP_EAMCET', 'Andhra Pradesh Engineering, Agriculture and Medical Common Entrance Test', 'Andhra Pradesh'),
    ('TS_EAMCET', 'Telangana Engineering, Agriculture and Medical Common Entrance Test', 'Telangana'),
    ('COMEDK', 'Consortium of Medical, Engineering and Dental Colleges', 'Karnataka'),
    ('WBJEE', 'West Bengal Joint Entrance Examination', 'West Bengal')
ON CONFLICT (system_code) DO NOTHING;

-- Insert branch masters
INSERT INTO branch_masters (branch_code, branch_name, category) VALUES
    ('CS', 'Computer Science and Engineering', 'Core'),
    ('CE', 'Civil Engineering', 'Core'),
    ('ME', 'Mechanical Engineering', 'Core'),
    ('EE', 'Electrical Engineering', 'Core'),
    ('EC', 'Electronics and Communication Engineering', 'Core'),
    ('IT', 'Information Technology', 'Core'),
    ('AE', 'Aeronautical Engineering', 'Specialized'),
    ('AU', 'Automobile Engineering', 'Specialized'),
    ('BM', 'Biomedical Engineering', 'Specialized'),
    ('BY', 'Biotechnology', 'Specialized'),
    ('CH', 'Chemical Engineering', 'Core'),
    ('CL', 'Civil and Structural Engineering', 'Specialized'),
    ('CO', 'Computer Science (Specialized)', 'Specialized'),
    ('GI', 'Geoinformatics', 'Specialized'),
    ('PA', 'Production and Automation', 'Specialized'),
    ('RM', 'Robotics and Mechatronics', 'Specialized'),
    ('SC', 'Structural and Construction Engineering', 'Specialized'),
    ('XC', 'Cross-disciplinary', 'Specialized'),
    ('AD', 'Architectural Design', 'Specialized'),
    ('AG', 'Agricultural Engineering', 'Specialized'),
    ('AL', 'Applied Electronics', 'Specialized'),
    ('AM', 'Advanced Manufacturing', 'Specialized'),
    ('AO', 'Aerospace Operations', 'Specialized'),
    ('AP', 'Applied Physics', 'Specialized'),
    ('AR', 'Architecture', 'Specialized'),
    ('AS', 'Applied Science', 'Specialized'),
    ('AT', 'Automotive Technology', 'Specialized'),
    ('BA', 'Building Architecture', 'Specialized'),
    ('BC', 'Biomedical Computing', 'Specialized'),
    ('BP', 'Building Planning', 'Specialized'),
    ('BS', 'Biomedical Science', 'Specialized'),
    ('BT', 'Biotechnology Engineering', 'Specialized'),
    ('CB', 'Computational Biology', 'Specialized'),
    ('CC', 'Cloud Computing', 'Specialized'),
    ('CD', 'Cyber Defense', 'Specialized'),
    ('CN', 'Communication Networks', 'Specialized'),
    ('FD', 'Food and Dairy Engineering', 'Specialized')
ON CONFLICT (branch_code) DO NOTHING;


-- ============================================================================
-- END OF SCHEMA
-- ============================================================================
