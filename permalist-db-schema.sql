PGDMP         .                |        	   permalist    15.4    15.4     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16613 	   permalist    DATABASE     }   CREATE DATABASE permalist WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Israel.1252';
    DROP DATABASE permalist;
                postgres    false            �            1259    16615    items    TABLE     G   CREATE TABLE public.items (
    id integer NOT NULL,
    title text
);
    DROP TABLE public.items;
       public         heap    postgres    false            �            1259    16614    items_id_seq    SEQUENCE     �   CREATE SEQUENCE public.items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.items_id_seq;
       public          postgres    false    215            �           0    0    items_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.items_id_seq OWNED BY public.items.id;
          public          postgres    false    214            e           2604    16618    items id    DEFAULT     d   ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);
 7   ALTER TABLE public.items ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215            �          0    16615    items 
   TABLE DATA           *   COPY public.items (id, title) FROM stdin;
    public          postgres    false    215   
       �           0    0    items_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.items_id_seq', 10, true);
          public          postgres    false    214            g           2606    16622    items items_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.items DROP CONSTRAINT items_pkey;
       public            postgres    false    215            �      x���L,NIK,�\�`W� l[     