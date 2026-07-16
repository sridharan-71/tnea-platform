# Database Project Folder Structure

**Purpose**: Organize database files, documentation, and scripts for the Engineering College Admission Platform

---

## Recommended Folder Structure

```
engineering-college-admissions-db/
│
├── README.md                          # Project overview and quick start guide
│
├── docs/                              # Documentation
│   ├── database_design_document.md    # Complete design specification
│   ├── data_dictionary.md             # Detailed table and column documentation
│   ├── design_rationale.md            # Design decisions and justifications
│   ├── erd.svg                        # Entity Relationship Diagram (visual)
│   ├── erd.d2                         # ERD source (D2 format)
│   ├── API_REFERENCE.md               # API endpoint documentation
│   ├── MIGRATION_GUIDE.md             # Data migration procedures
│   └── TROUBLESHOOTING.md             # Common issues and solutions
│
├── schema/                            # Database schema files
│   ├── schema.sql                     # Complete PostgreSQL schema
│   ├── 01_create_tables.sql           # Table creation (modular)
│   ├── 02_create_indexes.sql          # Index creation
│   ├── 03_create_views.sql            # View definitions
│   ├── 04_create_functions.sql        # Stored procedures
│   ├── 05_create_triggers.sql         # Trigger definitions
│   ├── 06_initial_data.sql            # Seed data (counselling systems, branches)
│   └── 07_grant_permissions.sql       # Role and permission setup
│
├── data/                              # Data files
│   ├── raw/
│   │   ├── colleges.json              # Original TNEA data
│   │   ├── districts.csv              # Geographic data
│   │   └── branches.csv               # Branch master data
│   │
│   ├── processed/
│   │   ├── colleges_cleaned.csv       # Cleaned college data
│   │   ├── colleges_with_branches.csv # Denormalized for import
│   │   └── validation_report.txt      # Data quality report
│   │
│   └── backups/
│       ├── backup_2026_07_13.sql.gz   # Full database backup
│       ├── backup_2026_07_12.sql.gz   # Previous backup
│       └── incremental_2026_07_13.sql # Incremental backup
│
├── scripts/                           # Utility scripts
│   ├── migration/
│   │   ├── migrate_from_json.py       # JSON to PostgreSQL migration
│   │   ├── migrate_from_csv.py        # CSV to PostgreSQL migration
│   │   ├── validate_data.py           # Data quality validation
│   │   └── rollback.py                # Rollback procedures
│   │
│   ├── maintenance/
│   │   ├── backup_database.sh         # Automated backup script
│   │   ├── optimize_indexes.sql       # Index optimization
│   │   ├── analyze_tables.sql         # Update statistics
│   │   ├── vacuum_database.sql        # Cleanup and maintenance
│   │   └── monitor_performance.py     # Performance monitoring
│   │
│   ├── reporting/
│   │   ├── generate_statistics.sql    # Database statistics
│   │   ├── audit_report.sql           # Audit trail report
│   │   ├── data_quality_report.py     # Data quality metrics
│   │   └── performance_report.py      # Query performance analysis
│   │
│   └── testing/
│       ├── test_queries.sql           # Test queries for validation
│       ├── test_performance.py        # Performance testing
│       ├── test_data_integrity.sql    # Integrity checks
│       └── test_edge_cases.py         # Edge case testing
│
├── config/                            # Configuration files
│   ├── database.conf                  # Database connection settings
│   ├── backup.conf                    # Backup configuration
│   ├── monitoring.conf                # Monitoring settings
│   └── security.conf                  # Security policies
│
├── logs/                              # Log files
│   ├── migration_2026_07_13.log       # Migration logs
│   ├── backup_2026_07_13.log          # Backup logs
│   ├── error_2026_07_13.log           # Error logs
│   └── query_performance.log          # Query performance logs
│
├── examples/                          # Example queries and use cases
│   ├── search_queries.sql             # College search examples
│   ├── filter_queries.sql             # Filtering examples
│   ├── comparison_queries.sql         # College comparison examples
│   ├── analytics_queries.sql          # Analytics examples
│   └── python_examples.py             # Python client examples
│
├── performance/                       # Performance optimization
│   ├── index_analysis.sql             # Index usage analysis
│   ├── query_plans.txt                # Explain plans for key queries
│   ├── slow_queries.log               # Slow query log
│   └── optimization_recommendations.md # Performance tuning guide
│
├── security/                          # Security-related files
│   ├── roles.sql                      # Role definitions
│   ├── permissions.sql                # Permission assignments
│   ├── encryption.conf                # Encryption settings
│   └── audit_setup.sql                # Audit trail setup
│
├── deployment/                        # Deployment files
│   ├── docker-compose.yml             # Docker Compose configuration
│   ├── Dockerfile                     # Docker image definition
│   ├── kubernetes/
│   │   ├── postgres-deployment.yaml   # Kubernetes deployment
│   │   ├── postgres-service.yaml      # Kubernetes service
│   │   └── postgres-pvc.yaml          # Persistent volume claim
│   └── terraform/
│       ├── main.tf                    # Terraform configuration
│       ├── variables.tf               # Terraform variables
│       └── outputs.tf                 # Terraform outputs
│
├── .gitignore                         # Git ignore patterns
├── .env.example                       # Environment variables template
├── LICENSE                            # License file
└── CHANGELOG.md                       # Version history and changes
```

---

## File Organization Details

### docs/ - Documentation

**Purpose**: Comprehensive documentation for the database

| File | Purpose |
|------|---------|
| database_design_document.md | Complete design specification, normalization strategy, and rationale |
| data_dictionary.md | Detailed documentation of every table and column |
| design_rationale.md | Design decisions, trade-offs, and justifications |
| erd.svg | Visual Entity Relationship Diagram |
| erd.d2 | ERD source file (editable) |
| API_REFERENCE.md | REST API endpoint documentation (future) |
| MIGRATION_GUIDE.md | Step-by-step data migration procedures |
| TROUBLESHOOTING.md | Common issues, errors, and solutions |

### schema/ - Database Schema

**Purpose**: Modular SQL files for schema creation

| File | Purpose |
|------|---------|
| schema.sql | Complete schema (all-in-one) |
| 01_create_tables.sql | Table definitions only |
| 02_create_indexes.sql | Index creation |
| 03_create_views.sql | View definitions |
| 04_create_functions.sql | Stored procedures and functions |
| 05_create_triggers.sql | Trigger definitions |
| 06_initial_data.sql | Seed data (counselling systems, branches) |
| 07_grant_permissions.sql | Role and permission setup |

**Usage**:
```bash
# Option 1: Load complete schema
psql -U postgres -d engineering_admissions -f schema/schema.sql

# Option 2: Load modular files
psql -U postgres -d engineering_admissions -f schema/01_create_tables.sql
psql -U postgres -d engineering_admissions -f schema/02_create_indexes.sql
psql -U postgres -d engineering_admissions -f schema/03_create_views.sql
# ... etc
```

### data/ - Data Files

**Purpose**: Organize raw, processed, and backup data

**raw/**: Original source data
- colleges.json: Original TNEA data from PDF
- districts.csv: Geographic master data
- branches.csv: Branch master data

**processed/**: Cleaned and validated data ready for import
- colleges_cleaned.csv: Data quality checks applied
- colleges_with_branches.csv: Denormalized for bulk import
- validation_report.txt: Data quality metrics

**backups/**: Database backups
- backup_YYYY_MM_DD.sql.gz: Full database backups
- incremental_YYYY_MM_DD.sql: Incremental backups

### scripts/ - Utility Scripts

**migration/**: Data migration scripts
```python
# migrate_from_json.py
# Converts colleges.json to PostgreSQL format
python scripts/migration/migrate_from_json.py \
    --input data/raw/colleges.json \
    --output data/processed/colleges.csv \
    --validate
```

**maintenance/**: Database maintenance
```bash
# backup_database.sh
# Automated daily backup
./scripts/maintenance/backup_database.sh \
    --database engineering_admissions \
    --output data/backups/
```

**reporting/**: Generate reports
```sql
-- generate_statistics.sql
-- Database statistics and metrics
psql -U postgres -d engineering_admissions \
    -f scripts/reporting/generate_statistics.sql
```

**testing/**: Validation and testing
```sql
-- test_queries.sql
-- Validate database functionality
psql -U postgres -d engineering_admissions \
    -f scripts/testing/test_queries.sql
```

### config/ - Configuration Files

**Purpose**: Centralized configuration management

```ini
# database.conf
[connection]
host = localhost
port = 5432
database = engineering_admissions
user = admin_user
password = ${DB_PASSWORD}

[performance]
max_connections = 100
shared_buffers = 256MB
effective_cache_size = 1GB

[backup]
retention_days = 30
backup_time = 02:00
backup_location = /backups/postgresql/
```

### logs/ - Log Files

**Purpose**: Track database operations and errors

```
migration_2026_07_13.log    # Migration execution log
backup_2026_07_13.log       # Backup execution log
error_2026_07_13.log        # Error log
query_performance.log       # Query performance metrics
```

### examples/ - Example Queries

**Purpose**: Common query patterns and use cases

```sql
-- search_queries.sql
-- Find colleges by name
SELECT * FROM colleges 
WHERE to_tsvector('english', college_name) @@ to_tsquery('english', 'anna');

-- filter_queries.sql
-- Find autonomous colleges in Chennai with CS branch
SELECT DISTINCT c.college_name
FROM colleges c
JOIN college_branches cb ON c.college_id = cb.college_id
JOIN branch_masters b ON cb.branch_id = b.branch_id
WHERE c.autonomous_status = TRUE 
  AND c.district_id = (SELECT district_id FROM districts WHERE district_name = 'CHENNAI')
  AND b.branch_code = 'CS';

-- comparison_queries.sql
-- Compare hostel costs between colleges
SELECT c1.college_name, c2.college_name, 
       (c1.mess_bill + c1.room_rent) as cost1,
       (c2.mess_bill + c2.room_rent) as cost2
FROM hostel_facilities c1
JOIN hostel_facilities c2 ON c1.college_id != c2.college_id
WHERE c1.gender = 'Girls' AND c2.gender = 'Girls'
ORDER BY ABS((c1.mess_bill + c1.room_rent) - (c2.mess_bill + c2.room_rent));
```

### performance/ - Performance Optimization

**Purpose**: Track and optimize database performance

```sql
-- index_analysis.sql
-- Analyze index usage
SELECT schemaname, tablename, indexname, idx_scan, idx_tup_read, idx_tup_fetch
FROM pg_stat_user_indexes
ORDER BY idx_scan DESC;

-- query_plans.txt
-- Explain plans for key queries
EXPLAIN ANALYZE
SELECT * FROM colleges WHERE district_id = 10;
```

### security/ - Security Configuration

**Purpose**: Manage database security and access control

```sql
-- roles.sql
CREATE ROLE admin_user WITH LOGIN PASSWORD 'secure_password';
CREATE ROLE read_only_user WITH LOGIN PASSWORD 'secure_password';
CREATE ROLE api_user WITH LOGIN PASSWORD 'secure_password';

-- permissions.sql
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO admin_user;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO read_only_user;
GRANT SELECT ON colleges, college_branches, branch_masters TO api_user;
```

### deployment/ - Deployment Configuration

**Purpose**: Deploy database in different environments

**Docker**:
```yaml
# docker-compose.yml
version: '3.8'
services:
  postgres:
    image: postgres:13
    environment:
      POSTGRES_DB: engineering_admissions
      POSTGRES_USER: admin_user
      POSTGRES_PASSWORD: ${DB_PASSWORD}
    volumes:
      - postgres_data:/var/lib/postgresql/data
      - ./schema:/docker-entrypoint-initdb.d
    ports:
      - "5432:5432"
```

**Kubernetes**:
```yaml
# postgres-deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: postgres
spec:
  replicas: 1
  template:
    spec:
      containers:
      - name: postgres
        image: postgres:13
        env:
        - name: POSTGRES_DB
          value: engineering_admissions
```

---

## File Naming Conventions

### SQL Files
- `01_create_tables.sql` - Numbered for execution order
- `schema.sql` - Complete schema
- `backup_2026_07_13.sql.gz` - Backups with date

### Python Scripts
- `migrate_from_json.py` - Snake case
- `validate_data.py` - Descriptive names
- `test_queries.py` - Test prefix for tests

### Configuration Files
- `database.conf` - Lowercase with .conf extension
- `.env.example` - Environment template

### Documentation
- `README.md` - Project overview
- `CHANGELOG.md` - Version history
- `MIGRATION_GUIDE.md` - Procedure documentation

---

## Git Repository Structure

```
.gitignore
├── # Ignore sensitive files
├── .env                          # Ignore (use .env.example)
├── config/database.conf          # Ignore (use template)
├── data/backups/                 # Ignore (large files)
├── logs/                         # Ignore (runtime logs)
└── # Track everything else
```

**Example .gitignore**:
```
.env
.env.local
config/database.conf
data/backups/
logs/
*.log
*.tmp
__pycache__/
*.pyc
.DS_Store
```

---

## Quick Start Commands

```bash
# Clone repository
git clone https://github.com/your-org/engineering-college-admissions-db.git
cd engineering-college-admissions-db

# Create database
createdb engineering_admissions

# Load schema
psql -U postgres -d engineering_admissions -f schema/schema.sql

# Migrate data
python scripts/migration/migrate_from_json.py \
    --input data/raw/colleges.json \
    --validate

# Run tests
psql -U postgres -d engineering_admissions -f scripts/testing/test_queries.sql

# Backup database
./scripts/maintenance/backup_database.sh

# Generate reports
psql -U postgres -d engineering_admissions -f scripts/reporting/generate_statistics.sql
```

---

## Maintenance Schedule

| Task | Frequency | Script |
|------|-----------|--------|
| Full Backup | Daily (2 AM) | backup_database.sh |
| Incremental Backup | Every 6 hours | backup_database.sh --incremental |
| Index Optimization | Weekly | optimize_indexes.sql |
| Table Analysis | Weekly | analyze_tables.sql |
| Vacuum | Monthly | vacuum_database.sql |
| Performance Report | Monthly | performance_report.py |
| Data Quality Check | Monthly | validate_data.py |
| Security Audit | Quarterly | audit_report.sql |

---

**Document Version**: 1.0  
**Last Updated**: July 2026  
**Status**: Ready for Use
