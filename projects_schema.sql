drop table if exists step;
drop table if exists project_category;
drop table if exists category;
drop table if exists material;
drop table if exists project;

create table project(
	project_id INT AUTO_INCREMENT NOT NULL,
	project_name VARCHAR(128) NOT NULL,
	estimated_hours DECIMAL(7,2),
	actual_hours DECIMAL(7,2),
	difficulty INT,
	notes TEXT,
	PRIMARY KEY (project_id)
);

create table material(
	material_id INT AUTO_INCREMENT NOT NULL,
	project_id INT NOT NULL,
	material_name VARCHAR(128) not null,
	num_required INT,
	cost DECIMAL(7,2),
	PRIMARY KEY (material_id),
	foreign key (project_id) references project (project_id) on delete cascade
);

create table category (
	category_id INT AUTO_INCREMENT NOT NULL,
	category_name VARCHAR(128) NOT null,
	PRIMARY KEY (category_id)
);

create table project_category(
	project_id INT NOT NULL,
	category_id INT NOT NULL,
	FOREIGN KEY (project_id) references project (project_id) on delete Cascade,
	foreign key (category_id) references category (category_id) on delete cascade,
	unique key (project_id, category_id)
);

create table step(
	step_id INT AUTO_INCREMENT NOT NULL,
	project_id INT NOT NULL,
	step_text TEXT not Null,
	step_order INT not null,
	PRIMARY KEY (step_id),
	foreign key (project_id) references project (project_id) on delete cascade
);




