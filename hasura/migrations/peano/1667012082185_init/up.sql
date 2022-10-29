SET check_function_bodies = false;
CREATE TABLE public.boolean_values (
    value_id bigint NOT NULL,
    body boolean NOT NULL
);
CREATE TABLE public.categories (
    id integer NOT NULL,
    slug text NOT NULL,
    name text NOT NULL,
    post_type_id integer NOT NULL,
    project_id integer NOT NULL
);
CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;
CREATE TABLE public.datetime_values (
    value_id bigint NOT NULL,
    body timestamp without time zone NOT NULL
);
CREATE TABLE public.field_types (
    id integer NOT NULL,
    slug text NOT NULL,
    name text NOT NULL,
    "order" integer DEFAULT 10 NOT NULL,
    input_type_id integer NOT NULL,
    input_post_type_id integer,
    project_id integer NOT NULL
);
CREATE SEQUENCE public.field_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.field_types_id_seq OWNED BY public.field_types.id;
CREATE TABLE public.fields (
    id bigint NOT NULL,
    slug text NOT NULL,
    name text NOT NULL,
    is_required boolean DEFAULT false NOT NULL,
    is_multiple boolean DEFAULT false NOT NULL,
    "order" integer DEFAULT 10 NOT NULL,
    post_type_id integer NOT NULL,
    field_type_id integer NOT NULL
);
CREATE SEQUENCE public.fields_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.fields_id_seq OWNED BY public.fields.id;
CREATE TABLE public.files (
    id bigint NOT NULL,
    label text NOT NULL,
    url text NOT NULL,
    path text NOT NULL,
    media_id bigint NOT NULL
);
CREATE SEQUENCE public.files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.files_id_seq OWNED BY public.files.id;
CREATE TABLE public.float_values (
    value_id bigint NOT NULL,
    body numeric NOT NULL
);
CREATE TABLE public.input_types (
    id integer NOT NULL,
    slug text NOT NULL,
    name text NOT NULL
);
CREATE SEQUENCE public.input_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.input_types_id_seq OWNED BY public.input_types.id;
CREATE TABLE public.integer_values (
    value_id bigint NOT NULL,
    body integer NOT NULL
);
CREATE TABLE public.media_values (
    value_id bigint NOT NULL,
    media_id bigint NOT NULL
);
CREATE TABLE public.medias (
    id bigint NOT NULL,
    name text NOT NULL,
    media_type text NOT NULL,
    url text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    project_id integer NOT NULL,
    owner_id text
);
CREATE SEQUENCE public.medias_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.medias_id_seq OWNED BY public.medias.id;
CREATE TABLE public.post_types (
    id integer NOT NULL,
    slug text NOT NULL,
    name text NOT NULL,
    icon_tag text NOT NULL,
    "order" integer DEFAULT 10 NOT NULL,
    is_public boolean DEFAULT true NOT NULL,
    project_id integer NOT NULL
);
CREATE SEQUENCE public.post_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.post_types_id_seq OWNED BY public.post_types.id;
CREATE TABLE public.post_values (
    value_id bigint NOT NULL,
    post_id bigint NOT NULL
);
CREATE TABLE public.posts (
    id bigint NOT NULL,
    title text NOT NULL,
    author_id text,
    post_type_id integer NOT NULL,
    category_id integer,
    created_at timestamp with time zone DEFAULT now()
);
CREATE SEQUENCE public.posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;
CREATE TABLE public.posts_tags (
    post_id bigint NOT NULL,
    tag_id integer NOT NULL
);
CREATE TABLE public.project_settings (
    project_id integer NOT NULL,
    logo_id bigint,
    name text NOT NULL
);
CREATE TABLE public.projects (
    id integer NOT NULL,
    slug text NOT NULL,
    created_at timestamp with time zone DEFAULT now()
);
CREATE SEQUENCE public.projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;
CREATE TABLE public.projects_users (
    project_id integer NOT NULL,
    user_id text NOT NULL,
    role text NOT NULL
);
CREATE TABLE public.revisions (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    post_id bigint NOT NULL
);
CREATE SEQUENCE public.revisions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.revisions_id_seq OWNED BY public.revisions.id;
CREATE TABLE public.tags (
    id integer NOT NULL,
    slug text NOT NULL,
    name text NOT NULL,
    project_id integer NOT NULL
);
CREATE SEQUENCE public.tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;
CREATE TABLE public.text_values (
    value_id bigint NOT NULL,
    body text NOT NULL
);
CREATE TABLE public.user_profiles (
    user_id text NOT NULL,
    name text NOT NULL,
    icon_id bigint
);
CREATE TABLE public.users (
    id text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);
CREATE TABLE public."values" (
    id bigint NOT NULL,
    revision_id bigint NOT NULL,
    field_id bigint NOT NULL
);
CREATE SEQUENCE public.values_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.values_id_seq OWNED BY public."values".id;
ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);
ALTER TABLE ONLY public.field_types ALTER COLUMN id SET DEFAULT nextval('public.field_types_id_seq'::regclass);
ALTER TABLE ONLY public.fields ALTER COLUMN id SET DEFAULT nextval('public.fields_id_seq'::regclass);
ALTER TABLE ONLY public.files ALTER COLUMN id SET DEFAULT nextval('public.files_id_seq'::regclass);
ALTER TABLE ONLY public.input_types ALTER COLUMN id SET DEFAULT nextval('public.input_types_id_seq'::regclass);
ALTER TABLE ONLY public.medias ALTER COLUMN id SET DEFAULT nextval('public.medias_id_seq'::regclass);
ALTER TABLE ONLY public.post_types ALTER COLUMN id SET DEFAULT nextval('public.post_types_id_seq'::regclass);
ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);
ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);
ALTER TABLE ONLY public.revisions ALTER COLUMN id SET DEFAULT nextval('public.revisions_id_seq'::regclass);
ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);
ALTER TABLE ONLY public."values" ALTER COLUMN id SET DEFAULT nextval('public.values_id_seq'::regclass);
ALTER TABLE ONLY public.boolean_values
    ADD CONSTRAINT boolean_values_pkey PRIMARY KEY (value_id);
ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_slug_post_type_id_project_id_key UNIQUE (slug, post_type_id, project_id);
ALTER TABLE ONLY public.datetime_values
    ADD CONSTRAINT datetime_values_pkey PRIMARY KEY (value_id);
ALTER TABLE ONLY public.field_types
    ADD CONSTRAINT field_types_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.fields
    ADD CONSTRAINT fields_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.fields
    ADD CONSTRAINT fields_slug_post_type_id_key UNIQUE (slug, post_type_id);
ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_label_media_id_key UNIQUE (label, media_id);
ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.float_values
    ADD CONSTRAINT float_values_pkey PRIMARY KEY (value_id);
ALTER TABLE ONLY public.input_types
    ADD CONSTRAINT input_types_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.input_types
    ADD CONSTRAINT input_types_slug_key UNIQUE (slug);
ALTER TABLE ONLY public.integer_values
    ADD CONSTRAINT integer_value_pkey PRIMARY KEY (value_id);
ALTER TABLE ONLY public.media_values
    ADD CONSTRAINT media_values_pkey PRIMARY KEY (value_id);
ALTER TABLE ONLY public.medias
    ADD CONSTRAINT medias_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.post_types
    ADD CONSTRAINT post_types_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.post_types
    ADD CONSTRAINT post_types_slug_project_id_key UNIQUE (slug, project_id);
ALTER TABLE ONLY public.post_values
    ADD CONSTRAINT post_values_pkey PRIMARY KEY (value_id);
ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.posts_tags
    ADD CONSTRAINT posts_tags_pkey PRIMARY KEY (post_id, tag_id);
ALTER TABLE ONLY public.project_settings
    ADD CONSTRAINT project_settings_pkey PRIMARY KEY (project_id);
ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_slug_key UNIQUE (slug);
ALTER TABLE ONLY public.projects_users
    ADD CONSTRAINT projects_users_pkey PRIMARY KEY (project_id, user_id);
ALTER TABLE ONLY public.revisions
    ADD CONSTRAINT revisions_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_slug_project_id_key UNIQUE (slug, project_id);
ALTER TABLE ONLY public.text_values
    ADD CONSTRAINT text_values_pkey PRIMARY KEY (value_id);
ALTER TABLE ONLY public.user_profiles
    ADD CONSTRAINT user_profiles_pkey PRIMARY KEY (user_id);
ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public."values"
    ADD CONSTRAINT values_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.boolean_values
    ADD CONSTRAINT boolean_values_value_id_fkey FOREIGN KEY (value_id) REFERENCES public."values"(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_post_type_id_fkey FOREIGN KEY (post_type_id) REFERENCES public.post_types(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public.datetime_values
    ADD CONSTRAINT datetime_values_value_id_fkey FOREIGN KEY (value_id) REFERENCES public."values"(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public.field_types
    ADD CONSTRAINT field_types_input_post_type_id_fkey FOREIGN KEY (input_post_type_id) REFERENCES public.post_types(id) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE ONLY public.field_types
    ADD CONSTRAINT field_types_input_type_id_fkey FOREIGN KEY (input_type_id) REFERENCES public.input_types(id) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE ONLY public.field_types
    ADD CONSTRAINT field_types_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public.fields
    ADD CONSTRAINT fields_field_type_id_fkey FOREIGN KEY (field_type_id) REFERENCES public.field_types(id) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE ONLY public.fields
    ADD CONSTRAINT fields_post_type_id_fkey FOREIGN KEY (post_type_id) REFERENCES public.post_types(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_media_id_fkey FOREIGN KEY (media_id) REFERENCES public.medias(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public.float_values
    ADD CONSTRAINT float_values_value_id_fkey FOREIGN KEY (value_id) REFERENCES public."values"(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public.integer_values
    ADD CONSTRAINT integer_value_value_id_fkey FOREIGN KEY (value_id) REFERENCES public."values"(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public.media_values
    ADD CONSTRAINT media_values_media_id_fkey FOREIGN KEY (media_id) REFERENCES public.medias(id) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE ONLY public.media_values
    ADD CONSTRAINT media_values_value_id_fkey FOREIGN KEY (value_id) REFERENCES public."values"(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public.medias
    ADD CONSTRAINT medias_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE ONLY public.medias
    ADD CONSTRAINT medias_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public.post_types
    ADD CONSTRAINT post_types_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public.post_values
    ADD CONSTRAINT post_values_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(id) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE ONLY public.post_values
    ADD CONSTRAINT post_values_value_id_fkey FOREIGN KEY (value_id) REFERENCES public."values"(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_post_type_id_fkey FOREIGN KEY (post_type_id) REFERENCES public.post_types(id) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE ONLY public.posts_tags
    ADD CONSTRAINT posts_tags_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public.posts_tags
    ADD CONSTRAINT posts_tags_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.tags(id) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE ONLY public.project_settings
    ADD CONSTRAINT project_settings_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public.projects_users
    ADD CONSTRAINT projects_users_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE ONLY public.projects_users
    ADD CONSTRAINT projects_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE ONLY public.revisions
    ADD CONSTRAINT revisions_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public.text_values
    ADD CONSTRAINT text_values_value_id_fkey FOREIGN KEY (value_id) REFERENCES public."values"(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public.user_profiles
    ADD CONSTRAINT user_profiles_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public."values"
    ADD CONSTRAINT values_field_id_fkey FOREIGN KEY (field_id) REFERENCES public.fields(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ONLY public."values"
    ADD CONSTRAINT values_revision_id_fkey FOREIGN KEY (revision_id) REFERENCES public.revisions(id) ON UPDATE CASCADE ON DELETE CASCADE;
