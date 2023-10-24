PGDMP     +    "            	    {           node_postgres    15.2    15.2                 0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16398    node_postgres    DATABASE     �   CREATE DATABASE node_postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE node_postgres;
                postgres    false            �            1255    16463    delete_person(integer) 	   PROCEDURE     �   CREATE PROCEDURE public.delete_person(IN p_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM person
	WHERE id = p_id;
    
	COMMIT;
END;
$$;
 6   DROP PROCEDURE public.delete_person(IN p_id integer);
       public          postgres    false            �            1255    16462 $   get_person_by_id(integer, refcursor) 	   PROCEDURE     �   CREATE PROCEDURE public.get_person_by_id(IN p_id integer, INOUT result refcursor)
    LANGUAGE plpgsql
    AS $$
BEGIN
OPEN result FOR 
	SELECT id, 
		name, 
		surname, 
		date_created::text
	FROM person
	WHERE id = p_id; 
END;
$$;
 Q   DROP PROCEDURE public.get_person_by_id(IN p_id integer, INOUT result refcursor);
       public          postgres    false            �            1255    16411    get_persons(refcursor) 	   PROCEDURE     �   CREATE PROCEDURE public.get_persons(INOUT result refcursor)
    LANGUAGE plpgsql
    AS $$BEGIN
OPEN result FOR 
	SELECT id, 
		name, 
		surname, 
		date_created::text
	FROM person; 
END;
$$;
 ;   DROP PROCEDURE public.get_persons(INOUT result refcursor);
       public          postgres    false            �            1255    16415 "   insert_person(text, text, integer) 	   PROCEDURE     �   CREATE PROCEDURE public.insert_person(IN p_name text, IN p_surname text, INOUT next_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO person (name, surname)
	VALUES (p_name, p_surname)
    RETURNING id INTO next_id;
    
	COMMIT;
END;
$$;
 _   DROP PROCEDURE public.insert_person(IN p_name text, IN p_surname text, INOUT next_id integer);
       public          postgres    false            �            1255    16413 
   test_prc() 	   PROCEDURE     �   CREATE PROCEDURE public.test_prc()
    LANGUAGE plpgsql
    AS $$
        
BEGIN
insert into person(name, surname) values('qqq', 'www');
--open result for SELECT * FROM person; 
END;
$$;
 "   DROP PROCEDURE public.test_prc();
       public          postgres    false            �            1259    16400    person    TABLE     �   CREATE TABLE public.person (
    id integer NOT NULL,
    name text,
    surname text,
    date_created timestamp with time zone DEFAULT (now() AT TIME ZONE 'utc'::text)
);
    DROP TABLE public.person;
       public         heap    postgres    false            �            1259    16399    person_id_seq    SEQUENCE     �   CREATE SEQUENCE public.person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.person_id_seq;
       public          postgres    false    215                       0    0    person_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;
          public          postgres    false    214            j           2604    16403 	   person id    DEFAULT     f   ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);
 8   ALTER TABLE public.person ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215            �          0    16400    person 
   TABLE DATA           A   COPY public.person (id, name, surname, date_created) FROM stdin;
    public          postgres    false    215   �                  0    0    person_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.person_id_seq', 66, true);
          public          postgres    false    214            m           2606    16407    person person_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.person DROP CONSTRAINT person_pkey;
       public            postgres    false    215            �   �   x���1�0�99;jۉ�d���S'�J @�j)燦K{�O��^�SV]����!�� :CV<�ޒF���cT��r%K�o���N�~�W�>��2�P�:����� ��U����C�]����@��7,�\�X>���B�LU!	����	�	�D�u�����d�     