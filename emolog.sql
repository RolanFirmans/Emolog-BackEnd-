PGDMP  :    9                }            emolog    16.3    16.3 &    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    17269    emolog    DATABASE     �   CREATE DATABASE emolog WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE emolog;
                postgres    false            �            1259    17289    tbl_emotions    TABLE     �   CREATE TABLE public.tbl_emotions (
    emotion_id integer NOT NULL,
    emoji_code character varying(10) NOT NULL,
    emotion_name character varying(50) NOT NULL,
    description text
);
     DROP TABLE public.tbl_emotions;
       public         heap    postgres    false            �            1259    17288    tbl_emotions_emotion_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tbl_emotions_emotion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.tbl_emotions_emotion_id_seq;
       public          postgres    false    218            �           0    0    tbl_emotions_emotion_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.tbl_emotions_emotion_id_seq OWNED BY public.tbl_emotions.emotion_id;
          public          postgres    false    217            �            1259    17314    tbl_entries    TABLE     3  CREATE TABLE public.tbl_entries (
    entry_id integer NOT NULL,
    user_id integer NOT NULL,
    emotion_id integer NOT NULL,
    entry_text text,
    entry_date date NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    ai_analysis_score real,
    ai_analysis_keywords text
);
    DROP TABLE public.tbl_entries;
       public         heap    postgres    false            �            1259    17313    tbl_entries_entry_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tbl_entries_entry_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.tbl_entries_entry_id_seq;
       public          postgres    false    222            �           0    0    tbl_entries_entry_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.tbl_entries_entry_id_seq OWNED BY public.tbl_entries.entry_id;
          public          postgres    false    221            �            1259    17300 
   tbl_quotes    TABLE     �   CREATE TABLE public.tbl_quotes (
    quote_id integer NOT NULL,
    quote_text text NOT NULL,
    author character varying(100),
    emotion_id integer NOT NULL
);
    DROP TABLE public.tbl_quotes;
       public         heap    postgres    false            �            1259    17299    tbl_quotes_quote_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tbl_quotes_quote_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.tbl_quotes_quote_id_seq;
       public          postgres    false    220            �           0    0    tbl_quotes_quote_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.tbl_quotes_quote_id_seq OWNED BY public.tbl_quotes.quote_id;
          public          postgres    false    219            �            1259    17271 	   tbl_users    TABLE     w  CREATE TABLE public.tbl_users (
    user_id integer NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    password_hash character varying(255) NOT NULL,
    full_name character varying(100),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.tbl_users;
       public         heap    postgres    false            �            1259    17270    tbl_users_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tbl_users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.tbl_users_user_id_seq;
       public          postgres    false    216            �           0    0    tbl_users_user_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.tbl_users_user_id_seq OWNED BY public.tbl_users.user_id;
          public          postgres    false    215            ,           2604    17292    tbl_emotions emotion_id    DEFAULT     �   ALTER TABLE ONLY public.tbl_emotions ALTER COLUMN emotion_id SET DEFAULT nextval('public.tbl_emotions_emotion_id_seq'::regclass);
 F   ALTER TABLE public.tbl_emotions ALTER COLUMN emotion_id DROP DEFAULT;
       public          postgres    false    217    218    218            .           2604    17317    tbl_entries entry_id    DEFAULT     |   ALTER TABLE ONLY public.tbl_entries ALTER COLUMN entry_id SET DEFAULT nextval('public.tbl_entries_entry_id_seq'::regclass);
 C   ALTER TABLE public.tbl_entries ALTER COLUMN entry_id DROP DEFAULT;
       public          postgres    false    222    221    222            -           2604    17303    tbl_quotes quote_id    DEFAULT     z   ALTER TABLE ONLY public.tbl_quotes ALTER COLUMN quote_id SET DEFAULT nextval('public.tbl_quotes_quote_id_seq'::regclass);
 B   ALTER TABLE public.tbl_quotes ALTER COLUMN quote_id DROP DEFAULT;
       public          postgres    false    220    219    220            )           2604    17274    tbl_users user_id    DEFAULT     v   ALTER TABLE ONLY public.tbl_users ALTER COLUMN user_id SET DEFAULT nextval('public.tbl_users_user_id_seq'::regclass);
 @   ALTER TABLE public.tbl_users ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    215    216    216            �          0    17289    tbl_emotions 
   TABLE DATA           Y   COPY public.tbl_emotions (emotion_id, emoji_code, emotion_name, description) FROM stdin;
    public          postgres    false    218   �-       �          0    17314    tbl_entries 
   TABLE DATA           �   COPY public.tbl_entries (entry_id, user_id, emotion_id, entry_text, entry_date, created_at, ai_analysis_score, ai_analysis_keywords) FROM stdin;
    public          postgres    false    222   o.       �          0    17300 
   tbl_quotes 
   TABLE DATA           N   COPY public.tbl_quotes (quote_id, quote_text, author, emotion_id) FROM stdin;
    public          postgres    false    220   �.       �          0    17271 	   tbl_users 
   TABLE DATA           o   COPY public.tbl_users (user_id, username, email, password_hash, full_name, created_at, updated_at) FROM stdin;
    public          postgres    false    216   /       �           0    0    tbl_emotions_emotion_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.tbl_emotions_emotion_id_seq', 5, true);
          public          postgres    false    217            �           0    0    tbl_entries_entry_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.tbl_entries_entry_id_seq', 2, true);
          public          postgres    false    221            �           0    0    tbl_quotes_quote_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.tbl_quotes_quote_id_seq', 1, false);
          public          postgres    false    219            �           0    0    tbl_users_user_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.tbl_users_user_id_seq', 1, true);
          public          postgres    false    215            7           2606    17298 (   tbl_emotions tbl_emotions_emoji_code_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.tbl_emotions
    ADD CONSTRAINT tbl_emotions_emoji_code_key UNIQUE (emoji_code);
 R   ALTER TABLE ONLY public.tbl_emotions DROP CONSTRAINT tbl_emotions_emoji_code_key;
       public            postgres    false    218            9           2606    17296    tbl_emotions tbl_emotions_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.tbl_emotions
    ADD CONSTRAINT tbl_emotions_pkey PRIMARY KEY (emotion_id);
 H   ALTER TABLE ONLY public.tbl_emotions DROP CONSTRAINT tbl_emotions_pkey;
       public            postgres    false    218            =           2606    17322    tbl_entries tbl_entries_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.tbl_entries
    ADD CONSTRAINT tbl_entries_pkey PRIMARY KEY (entry_id);
 F   ALTER TABLE ONLY public.tbl_entries DROP CONSTRAINT tbl_entries_pkey;
       public            postgres    false    222            ;           2606    17307    tbl_quotes tbl_quotes_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.tbl_quotes
    ADD CONSTRAINT tbl_quotes_pkey PRIMARY KEY (quote_id);
 D   ALTER TABLE ONLY public.tbl_quotes DROP CONSTRAINT tbl_quotes_pkey;
       public            postgres    false    220            1           2606    17284    tbl_users tbl_users_email_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.tbl_users
    ADD CONSTRAINT tbl_users_email_key UNIQUE (email);
 G   ALTER TABLE ONLY public.tbl_users DROP CONSTRAINT tbl_users_email_key;
       public            postgres    false    216            3           2606    17280    tbl_users tbl_users_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.tbl_users
    ADD CONSTRAINT tbl_users_pkey PRIMARY KEY (user_id);
 B   ALTER TABLE ONLY public.tbl_users DROP CONSTRAINT tbl_users_pkey;
       public            postgres    false    216            5           2606    17282     tbl_users tbl_users_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.tbl_users
    ADD CONSTRAINT tbl_users_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.tbl_users DROP CONSTRAINT tbl_users_username_key;
       public            postgres    false    216            >           2606    17308    tbl_quotes fk_emotion    FK CONSTRAINT     �   ALTER TABLE ONLY public.tbl_quotes
    ADD CONSTRAINT fk_emotion FOREIGN KEY (emotion_id) REFERENCES public.tbl_emotions(emotion_id) ON DELETE CASCADE;
 ?   ALTER TABLE ONLY public.tbl_quotes DROP CONSTRAINT fk_emotion;
       public          postgres    false    4665    218    220            ?           2606    17328    tbl_entries fk_emotion    FK CONSTRAINT     �   ALTER TABLE ONLY public.tbl_entries
    ADD CONSTRAINT fk_emotion FOREIGN KEY (emotion_id) REFERENCES public.tbl_emotions(emotion_id) ON DELETE RESTRICT;
 @   ALTER TABLE ONLY public.tbl_entries DROP CONSTRAINT fk_emotion;
       public          postgres    false    218    4665    222            @           2606    17323    tbl_entries fk_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.tbl_entries
    ADD CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES public.tbl_users(user_id) ON DELETE CASCADE;
 =   ALTER TABLE ONLY public.tbl_entries DROP CONSTRAINT fk_user;
       public          postgres    false    222    4659    216            �   �   x�M�=�0�9>EN��tGB���U��4%C�\����8'�$��n���g������=�B8`���Ë��(|im��u�ou����쒃FD��vp��U�6����x�X��^��Z.��hh[2_u��xHq�p��>Ａ]���j���e���K��m�H2t6D���W      �   q   x�M�1�0k��GA��@��x͂,�!qБ��sM���#���L�d�q�>Q�ü$�hFBʠh���+����F!�u��ܹ5��8��7�*H'�޸s�h���ޟ?�$H      �      x������ � �      �   �   x�3�,��Ĩ����9�z����*FI*�*U�eIi�F��Q9�~�.���F����>��a�^y��)E��A���az��F�1~�FF��f@�``lebaej�gjdlih�m`�_�+F��� ��)�     