PGDMP         0                 y            BARLogistics    12.5    12.5 D    o           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            p           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            q           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            r           1262    16393    BARLogistics    DATABASE     �   CREATE DATABASE "BARLogistics" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE "BARLogistics";
                postgres    false            �            1259    16394    capitals    TABLE     �   CREATE TABLE public.capitals (
    name character varying NOT NULL,
    distance_from_bar integer,
    import_tax double precision
);
    DROP TABLE public.capitals;
       public         heap    postgres    false            �            1259    16400    orders    TABLE     �   CREATE TABLE public.orders (
    order_id integer NOT NULL,
    user_id integer,
    status character varying,
    price double precision,
    ship_date character varying,
    order_date character varying
);
    DROP TABLE public.orders;
       public         heap    postgres    false            �            1259    16406    orders_order_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.orders_order_id_seq;
       public          postgres    false    203            s           0    0    orders_order_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders.order_id;
          public          postgres    false    204            �            1259    16408    orders_parts    TABLE     w   CREATE TABLE public.orders_parts (
    order_id integer NOT NULL,
    part_id bigint NOT NULL,
    quantity integer
);
     DROP TABLE public.orders_parts;
       public         heap    postgres    false            �            1259    16411    parts    TABLE     �   CREATE TABLE public.parts (
    part_num integer NOT NULL,
    part_name character varying,
    location character varying,
    price double precision,
    volume integer,
    picture integer
);
    DROP TABLE public.parts;
       public         heap    postgres    false            �            1259    16417    parts_locations    TABLE     m   CREATE TABLE public.parts_locations (
    name character varying NOT NULL,
    distances_from_bar integer
);
 #   DROP TABLE public.parts_locations;
       public         heap    postgres    false            �            1259    16423    parts_parts_num_seq    SEQUENCE     �   CREATE SEQUENCE public.parts_parts_num_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.parts_parts_num_seq;
       public          postgres    false    206            t           0    0    parts_parts_num_seq    SEQUENCE OWNED BY     J   ALTER SEQUENCE public.parts_parts_num_seq OWNED BY public.parts.part_num;
          public          postgres    false    208            �            1259    16782    pictures    TABLE     �   CREATE TABLE public.pictures (
    id integer NOT NULL,
    path character varying,
    type character varying,
    img bytea
);
    DROP TABLE public.pictures;
       public         heap    postgres    false            �            1259    16780    pictures_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pictures_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.pictures_id_seq;
       public          postgres    false    217            u           0    0    pictures_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.pictures_id_seq OWNED BY public.pictures.id;
          public          postgres    false    216            �            1259    16425    roles    TABLE     W   CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(20)
);
    DROP TABLE public.roles;
       public         heap    postgres    false            �            1259    16428    roles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roles_id_seq;
       public          postgres    false    209            v           0    0    roles_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;
          public          postgres    false    210            �            1259    16430 
   user_roles    TABLE     ^   CREATE TABLE public.user_roles (
    user_id bigint NOT NULL,
    role_id integer NOT NULL
);
    DROP TABLE public.user_roles;
       public         heap    postgres    false            �            1259    16433    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying,
    password character varying,
    first_name character varying,
    last_name character varying,
    address character varying,
    email character varying(50)
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16439    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    212            w           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    213            �            1259    16441    vehicle_info    TABLE        CREATE TABLE public.vehicle_info (
    type character varying NOT NULL,
    fuel_consumption integer,
    avg_speed integer
);
     DROP TABLE public.vehicle_info;
       public         heap    postgres    false            �            1259    16447    vehicle_inventory    TABLE     �   CREATE TABLE public.vehicle_inventory (
    id integer NOT NULL,
    type character varying,
    availability boolean,
    order_id integer
);
 %   DROP TABLE public.vehicle_inventory;
       public         heap    postgres    false            �
           2604    16453    orders order_id    DEFAULT     r   ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);
 >   ALTER TABLE public.orders ALTER COLUMN order_id DROP DEFAULT;
       public          postgres    false    204    203            �
           2604    16454    parts part_num    DEFAULT     q   ALTER TABLE ONLY public.parts ALTER COLUMN part_num SET DEFAULT nextval('public.parts_parts_num_seq'::regclass);
 =   ALTER TABLE public.parts ALTER COLUMN part_num DROP DEFAULT;
       public          postgres    false    208    206            �
           2604    16785    pictures id    DEFAULT     j   ALTER TABLE ONLY public.pictures ALTER COLUMN id SET DEFAULT nextval('public.pictures_id_seq'::regclass);
 :   ALTER TABLE public.pictures ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            �
           2604    16455    roles id    DEFAULT     d   ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);
 7   ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    209            �
           2604    16456    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    212            ]          0    16394    capitals 
   TABLE DATA           G   COPY public.capitals (name, distance_from_bar, import_tax) FROM stdin;
    public          postgres    false    202   'M       ^          0    16400    orders 
   TABLE DATA           Y   COPY public.orders (order_id, user_id, status, price, ship_date, order_date) FROM stdin;
    public          postgres    false    203   KZ       `          0    16408    orders_parts 
   TABLE DATA           C   COPY public.orders_parts (order_id, part_id, quantity) FROM stdin;
    public          postgres    false    205   P[       a          0    16411    parts 
   TABLE DATA           V   COPY public.parts (part_num, part_name, location, price, volume, picture) FROM stdin;
    public          postgres    false    206   �[       b          0    16417    parts_locations 
   TABLE DATA           C   COPY public.parts_locations (name, distances_from_bar) FROM stdin;
    public          postgres    false    207   �b       l          0    16782    pictures 
   TABLE DATA           7   COPY public.pictures (id, path, type, img) FROM stdin;
    public          postgres    false    217   d       d          0    16425    roles 
   TABLE DATA           )   COPY public.roles (id, name) FROM stdin;
    public          postgres    false    209   �u       f          0    16430 
   user_roles 
   TABLE DATA           6   COPY public.user_roles (user_id, role_id) FROM stdin;
    public          postgres    false    211   /v       g          0    16433    users 
   TABLE DATA           ^   COPY public.users (id, username, password, first_name, last_name, address, email) FROM stdin;
    public          postgres    false    212   Yv       i          0    16441    vehicle_info 
   TABLE DATA           I   COPY public.vehicle_info (type, fuel_consumption, avg_speed) FROM stdin;
    public          postgres    false    214   �w       j          0    16447    vehicle_inventory 
   TABLE DATA           M   COPY public.vehicle_inventory (id, type, availability, order_id) FROM stdin;
    public          postgres    false    215   x       x           0    0    orders_order_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.orders_order_id_seq', 19, true);
          public          postgres    false    204            y           0    0    parts_parts_num_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.parts_parts_num_seq', 1318, true);
          public          postgres    false    208            z           0    0    pictures_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.pictures_id_seq', 1, true);
          public          postgres    false    216            {           0    0    roles_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.roles_id_seq', 1, false);
          public          postgres    false    210            |           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 9, true);
          public          postgres    false    213            �
           2606    16458    capitals capitals_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.capitals
    ADD CONSTRAINT capitals_pkey PRIMARY KEY (name);
 @   ALTER TABLE ONLY public.capitals DROP CONSTRAINT capitals_pkey;
       public            postgres    false    202            �
           2606    16460     orders_parts order_products_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.orders_parts
    ADD CONSTRAINT order_products_pkey PRIMARY KEY (order_id, part_id);
 J   ALTER TABLE ONLY public.orders_parts DROP CONSTRAINT order_products_pkey;
       public            postgres    false    205    205            �
           2606    16462    orders orders_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    203            �
           2606    16464 $   parts_locations parts_locations_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.parts_locations
    ADD CONSTRAINT parts_locations_pkey PRIMARY KEY (name);
 N   ALTER TABLE ONLY public.parts_locations DROP CONSTRAINT parts_locations_pkey;
       public            postgres    false    207            �
           2606    16466    parts parts_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.parts
    ADD CONSTRAINT parts_pkey PRIMARY KEY (part_num);
 :   ALTER TABLE ONLY public.parts DROP CONSTRAINT parts_pkey;
       public            postgres    false    206            �
           2606    16790    pictures pictures_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.pictures
    ADD CONSTRAINT pictures_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.pictures DROP CONSTRAINT pictures_pkey;
       public            postgres    false    217            �
           2606    16468    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    209            �
           2606    16470 !   users uk6dotkott2kjsp8vw4d0m25fb7 
   CONSTRAINT     ]   ALTER TABLE ONLY public.users
    ADD CONSTRAINT uk6dotkott2kjsp8vw4d0m25fb7 UNIQUE (email);
 K   ALTER TABLE ONLY public.users DROP CONSTRAINT uk6dotkott2kjsp8vw4d0m25fb7;
       public            postgres    false    212            �
           2606    16472 !   users ukr43af9ap4edm43mmtq01oddj6 
   CONSTRAINT     `   ALTER TABLE ONLY public.users
    ADD CONSTRAINT ukr43af9ap4edm43mmtq01oddj6 UNIQUE (username);
 K   ALTER TABLE ONLY public.users DROP CONSTRAINT ukr43af9ap4edm43mmtq01oddj6;
       public            postgres    false    212            �
           2606    16474    user_roles user_roles_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (user_id, role_id);
 D   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT user_roles_pkey;
       public            postgres    false    211    211            �
           2606    16476    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    212            �
           2606    16478    vehicle_info vehicle_info_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.vehicle_info
    ADD CONSTRAINT vehicle_info_pkey PRIMARY KEY (type);
 H   ALTER TABLE ONLY public.vehicle_info DROP CONSTRAINT vehicle_info_pkey;
       public            postgres    false    214            �
           2606    16480 (   vehicle_inventory vehicle_inventory_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.vehicle_inventory
    ADD CONSTRAINT vehicle_inventory_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.vehicle_inventory DROP CONSTRAINT vehicle_inventory_pkey;
       public            postgres    false    215            �
           2606    16481 #   orders_parts fk_orders_parts_orders    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders_parts
    ADD CONSTRAINT fk_orders_parts_orders FOREIGN KEY (order_id) REFERENCES public.orders(order_id) NOT VALID;
 M   ALTER TABLE ONLY public.orders_parts DROP CONSTRAINT fk_orders_parts_orders;
       public          postgres    false    2751    205    203            �
           2606    16486 "   orders_parts fk_orders_parts_parts    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders_parts
    ADD CONSTRAINT fk_orders_parts_parts FOREIGN KEY (part_id) REFERENCES public.parts(part_num) NOT VALID;
 L   ALTER TABLE ONLY public.orders_parts DROP CONSTRAINT fk_orders_parts_parts;
       public          postgres    false    205    206    2755            �
           2606    16491    orders fk_orders_users    FK CONSTRAINT        ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_orders_users FOREIGN KEY (user_id) REFERENCES public.users(id) NOT VALID;
 @   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk_orders_users;
       public          postgres    false    2767    203    212            �
           2606    16496    parts fk_parts_parts_locations    FK CONSTRAINT     �   ALTER TABLE ONLY public.parts
    ADD CONSTRAINT fk_parts_parts_locations FOREIGN KEY (location) REFERENCES public.parts_locations(name) NOT VALID;
 H   ALTER TABLE ONLY public.parts DROP CONSTRAINT fk_parts_parts_locations;
       public          postgres    false    2757    207    206            �
           2606    16791    parts fk_parts_picture    FK CONSTRAINT     �   ALTER TABLE ONLY public.parts
    ADD CONSTRAINT fk_parts_picture FOREIGN KEY (picture) REFERENCES public.pictures(id) NOT VALID;
 @   ALTER TABLE ONLY public.parts DROP CONSTRAINT fk_parts_picture;
       public          postgres    false    2773    217    206            �
           2606    16501    users fk_users_capitals    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_users_capitals FOREIGN KEY (address) REFERENCES public.capitals(name) NOT VALID;
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT fk_users_capitals;
       public          postgres    false    202    212    2749            �
           2606    16506 3   vehicle_inventory fk_vehicle_inventory_vehicle_info    FK CONSTRAINT     �   ALTER TABLE ONLY public.vehicle_inventory
    ADD CONSTRAINT fk_vehicle_inventory_vehicle_info FOREIGN KEY (type) REFERENCES public.vehicle_info(type) NOT VALID;
 ]   ALTER TABLE ONLY public.vehicle_inventory DROP CONSTRAINT fk_vehicle_inventory_vehicle_info;
       public          postgres    false    214    2769    215            �
           2606    16511 &   user_roles fkh8ciramu9cc9q3qcqiv4ue8a6    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT fkh8ciramu9cc9q3qcqiv4ue8a6 FOREIGN KEY (role_id) REFERENCES public.roles(id);
 P   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT fkh8ciramu9cc9q3qcqiv4ue8a6;
       public          postgres    false    211    2759    209            �
           2606    16516 &   user_roles fkhfh9dx7w3ubf1co1vdev94g3f    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT fkhfh9dx7w3ubf1co1vdev94g3f FOREIGN KEY (user_id) REFERENCES public.users(id);
 P   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT fkhfh9dx7w3ubf1co1vdev94g3f;
       public          postgres    false    211    2767    212            ]     x�uX�v�8\�_�]6�ߏ�l'v�G�-�9�3HDHX$�	�察*�N�f6�������;�\����4�1Ȣ4�,	�ʈQ���`A�WAy���o�4-�4�$EY�Y����ƈU/VO�����%HҪ�"o�giu/�8��*�c>�j�W�t7~���Z+VX�:fg\"�� N�����QO��2�kM+�|�~qc��,Iß��1�<H��dQTge^�q'q1��4���iZ��Y>)9��F��ȟ[���`ax�f'�3B�T)݇k�b�������.� Nx�;�r�d�e�VEB���g�^4r�"K2� O�s��V��u��B �]�"f&��N���c� ���E���I��3��A�9�1v�����>�7	�xby���6��t�_4�#nZY��p۩��ѽβT
�)͑7�7��^�0Xq�K
6g�v�R�y-͛l���5|���J�ѣ�g�^��e\FA�#΍���o��2a�	A=����+���yf�(V�.�g�F�rO۾�h���+Z�ն��Ys��V_Ĥ�"Os�eᕚ��3۱QAY'%ʨ��$��o�Y��w�����z�c��N7l����,B�Sh�&�M��|����g�A�(P�eZ�,��ζV��rGբw�ڋq�(�v׫}�%������p���Y��h�4��ߝ�n��E�� <1��C=��u��G#qɞ9׭�����sM��V�eyx���Zz��)(Ҽ`�&�j��p)�7bV�߷]�_���x`��.g���7������ܗ�̘H[=" �[��(,��4�Aۃ��z���������=�,�K�F�`7WAQŬ�$�//�NuVG!\�W{=�䟎��`��X��u��sq**�K^�#�A ��q��E�5/��N�a|��uV�*��ĖK=��V����'S{3�������e���U3�|�[����:�`r!��=g�`���ct7��rX��_�l�%A	h�Q���mŬ�[��ʪQ� ˳��O��_��F��4�"8[��jD<>O�&F�r�,�j'@=��-�6ʢb��!�Q�.��s��gQE�7��/�eD8%��<�&��hݎq�� �+p����GG�@YbK��#��RhԪ" ���L��%�(f�ү�j�AWR���׵o�si�2-f��vP����a��E��>Hk����])q�h�8��1��_� �":��qx���)Z]����ߙ����P��`��%.�]ف�Ε�4o���M�Lƺ�g{���'޻�"��!�|�ӃQ���յP(�:���y���ݫV�Gx}����q�ܳ#��?�	�smG@�	�-�z���3`�u/]:�2v���{��&�;���ظ�	S]��@�f� �A�<�� h��Ր�I؍�m׈��&��A���e�����$�Ue�MD/������OPWE��z@+�z@L�΢?A*T�S ̖��q����Xha�'M�;����x�zx�o�40ą�r���5�6��i�o��9�烴Ht�!���!r��!�W2Ѝ2jDD���]�A:��z�T@���n�+R����y�'�-Q=�A"[7'Ӟ޼��'װ-E��+@"eg�
��V�N^�U�0��X�ƭP�/�,c�)�Ą��2��h�*�"�N�҃���ӯy��b'3�F�b�ሳ��W�}�π��8KH#�l��'Տ�N\1w�	�8͘�����G�������$�"ɠu�9#�R�-܊i/LP&yͻe����*i�ūB#�
��~k��5�|bMWd�o4��lԋ?��EP����H�x�~,˙-���"bd�ӳ5�b���׉u��MB�6��^[q�wz����]H��&GBKV��q�D/(��f#��.�俐��ثE4�:(:��fiaT�c-\�8O��}�_ ����K�Q�y�չ���P �,��b<�H��7�i5Ֆ��dk4�,�,�&���?{월��hF�hgw�Y�o/
ʋ(%NǓj�+�@ρ9�]���~���4;�^��zX"�S �W���~�
�S�J��B7b� �p/���2���^(``�@��,,����y�C��[�Cҿ��t�����L�j'u2Bd׽��<ш)�0Pp�}�ώ���7��	1G�$����B�PEE�`B砏���|'�����WQ�L�v�Wq
����ɢ��?�F���#+w@��a�q!���qC�֙{������sKy�/p�J�_�(9���9�a\��P$�ד��k\O<��8�U�$�y��w^q�~�vW�#����QU���3YOڧ:Qf�n�1����H)r�^�;����$v�G��}�B#���\'��_����8��ڥ�tx�½!�ë�WgAVS��T�cF�(>�^�ܨy��\x���6�O.���_z��7Q��B�~���s;^�UyUy0_	����&�#ߔ�@55j�?��On�W[����1Nܨ#���,|�>��h:���Z��ع���2�_R�LA�`�����
1��4�����.�����П��ؽ��@.�P|��,��Pε�*q�.���!2n_��kV���M�<m��{��r��D�{�R:,���lB��'C=�����
kc6��r��޷�Q�L>F�����[�ڠ�ɯ�l6RSf{�PZb��7�����RaN~wKczxs䋗���b��	*s��Q	A�c1@0݊� �_���fm����AO88��!�X7�2���"M}�6��:���W�� /U�`(f��U�o�.̃����[�=U����B�n�>i+Pqh0�G�A���.-hy�IڞՂj�_��r.u�	*[1��v�s'�*7˴��vb��,���.�y�0����!d�"OɶUx���Vc*�W���`?�^��Y v�C�@�X��K	�(�q���;��*��hkG���骈5�^7\�m�9Hhh7������lL_�� Dђ�/v�ܤ�Ř�]7�'�b [b����ʼV�9��|�<�5K��p���e'(���j��k���A��ХiF-������{�� WQ:9��CL�;�.�63�a�փ��Qc�Ag�N����F����pHY�^�m5��X|���r(g�d�ɱɓ12e�XDЀ�{��I��a���m�^ ;Oh�7�(��,_���A�����Ed�^Y�8�Dv��H��.���ɽ�ˏ�E���S�d��/5`��ȟh�s���u�g      ^   �   x�}�Mj�0F��)|��Y�t�.�@J=�Ii��x���-�%K��y�پ�5�1.ȉ���)�%
F)'ӌt0��іɢp��2����u�g�@�kF>�v�k����GAe*�t�������2	���%XCz����Y�K�����Pd3�s�g���q��Xg�ǁ�⤹�����Q� 	��If>?�Z�u��a�����䢋c���������z�у�� �P�(      `   W   x�=��� г���1���:�H��ց=o=�=8!?��B)IJ��{�_K�Z!�Պ��yO$Gw�"��xil�U�}���      a   #  x�mWˎ۸]3_��E7$��U���c�$�h72w1Z�mh����J|u�]pY�U�N��<�ɇ���|R�v|��ܫ�^^	�HE�wpb䃄U�{9I5
M~p=rR�)2��w�T-NW1N�e6��=�W�Z[��ì���ĵ��!z��8G�u�����I��
��*�z����X�-�S�'y׫�Lw������Y���fx��0�GVX�3d{��IhzՎ���>�.���Z�`�����0�2C��;7�w��B{y<MfW��0��˄�7-ߴ�m�)ې��8����8�=�q!C0��V�'i�55.t���E���YL� ����Σ¿�u��q�/@Q�G>�?��%^��Zl`�x��Zˉg�0Pǈ����#��j!ǃҝ����>)Y��i��\�8�� P9,��Tev��JF�y�N�<~Y�G�z9���I�"/	��6�G[�E���{�6��7����,���I���e����*�( h�� ��ޫ��(灚^��px�,��QOa�"?Z�q<�Qк��s1��f�|��k��8�\Jއ۶�=I*K�5(�9��t�J򤔗�R��Ґ��S�|��Kq���vh��{l��A�����/���s�t�� ��k(���Ӻ .7;+��ph�-%����g3�����-��zoG��?�4K{��Ƀ�'C����sߋ��i�_��7�S��ҁ{a`�{���:��M��g69��p�ӊ繁�E�A+C',���nX<p��������ի<���x�
��4��;��'H��As{���js��;A���^NZx�F>��C�U(K���[
�Y ?�B�m���<%"UEִ��R��;�xfp��D�ۆ|~޺W�|��|�u�H��7䋭���  !�&#_�/���c�u"E��:��)��,\R&�|��lrGE�(�_����)�N:��� ���8.㟞ŭ��A��(E��Oܜv��=�`0�}*Y��?G�G��S_g��:�������5Y�H�#N�hZ���Wف�^z$�f���bY/����;�:8@��&�{jE�H���Ƀ[�]���F-Ê���w�*렄+�3b���"�����:�9IW"/�7��
m[D�2,X��áOF���&Nmp�N\���Hzن|�Wy��V�`��I��e�=���bU�W��0��>ưD=,z���&]��r�G�C���L6'�j�A�G?cbR�Rol_�970���~�;&
�ޱ��X���'�R?�=�\Z(WłA��Ҋ�ǔ���0Y^��K���Q���~�B��z�]�@����΁�E'�.���,�w	��_K��;��ZZe����fPг�Ջ�����d�5E&�Qg�haX��Ɍgq|��XLt���41�؀����I-ⲗ8l�3�}>F�'��"��j;$�a,7�y\;��u����/��U,yU��<ҫ4q	
�뜼
��i�ގ�ĭ!�;�����n��N3��I��	����k�P�͆���)�N��a��$�)~&�� �����~�m�AbB5ɗ_�xd?{��Ћ��0.�_�e����=���Ы1`����_��P?'�F�
�����̏\���a��A�G���Z%sq�bK���=^�r�%�ߞ�����_�-n�H7����7�s����C�')�^�����T����Y�_� $�C�H��6��E����YO�?�/g��w1I�n|�l�^P�|ӛ߳��}��(ه���X�_mK�$M���;��A'i��ܽ�����'�u?�1��؞_g�S�{��X4#���;��߽{�/7@�      b   
  x��MN�0��oN� ��$[�RA�	�敘Ī;�D�Ƃ#q�lG�f������<���=I!p�ā�Z��81#�Y�Na�R��)٠s��H6]�91I)��ǸB�>���Tv���ޑ�쾗4۩w�,j<�l'M��0�\6����6۲p���qr'Ҧ�!�.���/�k��8,ɒZ�]�c��5Z�Z�h��M��A>�@;s��[�/��
Eo٥q.]��#��j�*��r�Vmk����GR*���<�����!�d�      l      x���I�u�q���b,�H셓���4�@��w^C�EQ6��_�}��'O�b�����?����/����������~��{a�ݔRN��h���79�����vJ��r��f.�����{�y~��l�����������S˛����y��w=���re�]nM�r����Z˩��ܲY��o�tsO/�<Kd�?��%x�����}��j/��g�M���w��������ϟ���ʒ���'_p�K�%�rU��j��]��{���߿Q�Թ��i?����Ճ����g�*}���׽�-��*�U����O�Պ�<�^K+��2���_��U�
XzmVO�����z���������������������Z��� (�}V޳�����k�������������M�;��Yc�3"�Y���6w�����vO�P[h�]����9(�~=lsE뗡�G�\^^��s��,�7ưa�a���^�Xs�9��^�IvyL�N��ܲV�S�j5NT�u�^�/�Ybt^o}�hw�v��>�%�����Y���j�o��h�Dr	`D�����30��U�{��}.p��w/�To�k;�T�Xޞ�΋s�nu��fҶR�fPLzΒ�<1S5��C�^��ֺk�7:���|���N�7�tV�El����N�w^,��*�}~^+#B�����܉[BV���׽�I�V�G��.�	��V����r�Q�}G���9��/�۪���S�f�q���5��ǡ����')�+3E��#���f)�:����!%��؏��gw�-+��I뽔5�������沞�i��6�.X9�cM@s��'�m���6Y����b�S(����nS��R	`��.�S�Z),�`��`_T�|w�
|�1���@�� <{���k���B@<�F�FƂ��o��/�"�)���E'�3Ӭ &g/W+���H<d��y|��V\  Vo���n?�k��.t8s���;����M��R�~Ű���=R�m���ĵ����`0�}5����53)�ģ���f� ں!�ņc�7�X� #Ii��,κ�y��h]v�z�v0-�;������|��v���=/�/Q��~�9��߽w�J��+`�i+T��?���O�)�;^^��m����k[\Rl�"�=׃��Z����1��UF�	��@%��~GKg�B�
�+5ze$��5F?�Q�|�X��f�ޖk��m�=2��-�����!��As��9�g�1}��:@��!$r�Bv@w�U���P0M�z@����d)�4��e�s㙅�uX�����뇉��й��۝yABJ���P��'�b��"��*�%`�@�;(=�݄3����VBz��6��i�o��a{���*p9�!@~P�i�	[f�0A7P�Q�m�f���F��	G�
���a�XL�{�*W7Ȯ��޶����ZX�pך`� {�\5O���>��@��#C�^�B�(��^)z��.�p!�6śT,B�#����۝�v�@uFA$�7��W�=`��#��Ru�n�	8ۥPj���)t��'�A�q����M���U_ �:���%[�l�!�MN��S�9��
R�P���I�xw��A'/:��aFM�{�iv�>�a���c��0K�k���ܛ�?����;._]�h$ze��A�r5.���Va:Ķ/.h�� �Z����� L��!]xl��ܬG���XV-�)E��.H�j�È��f��4��D5��T��~��A�μ��
йj��K;���c�l�7X�WX��3���A=a@Ψ����ލ@hd�@�X��ϵ�4��5C�^K�?�3r��2lBb�i;i���3���|5�,h	,1>d6*�Q�s|h�����1)d��Go������A-U�-&d	�JG��f�b*�8f�t�+�.tW�{5��ּ ��z��vȂx*QC��-�Q(�xӌU��B�J��,����.,�E�#�%�``@��D����֒@m�^�F���"Q��dݻ䐽eF�`�-��Qh�DT�,{�^Sx�B����=�1��ױYȊ�6zH�����և��`Yw���<��F�]JT`�6� f�ڕ_!����1r��#=�1��x��͊pk8>;!�w��2N��q�S�01$Yέ4���`x���s��@v��t�\fz�GD�T��R��B�'�Pץ��^s�2#��j㍦.�w|G�s��#�R<��d��_��iF��oBE9-��ۦg�8��)̉sS�GǷ�����s"|�҆N�J<:8#̡��ۗ�,;A����|���u�����`q��E�{zzM�ov����v�u?F�m&��.�:B𼖔b���'���1\ST.a$8��AX����o��!aa�����7�6w:�D6dI�`u88yX���wf��,z�,C��体\��&?@'=�\�ѵKGj"D�uCڐk	� �z�YI���8)��ə�g�:YlF�hf'��{�6�<�0ЩZ�!��/�
��!/~I���Wr�G�N���[���tf�������_"�����u��|�	 �&������T�����"�Ƞ}H��ĨR��TIg�,� �5�]4=p�>y �;��x����,�20�eJX�N�^�&�g��WEц���/�X�^�X��#2(/���ʰ7�Il�ǭK��)=�7��!5"��{<�(w�&�7�t���eW�����+��	� o�줹�T�m@. �}E|FEa'�����8:H��� �������p�G�s ��R �H�`��N	������Jr�V�z�Z���1d(A�c ��E>��=	BHF;�Y�!�Hڡ��#�`�:�$�nx�j��LZ�Vo��y���ՉQo�o4F�Sɢ���+4�0/sJ�]����n�9F��-������;��,�}�~�:F�ƴ�9?�Y��F����P���$)�A�D}��$B!ѱ1��� ��K�$X�M�ە��z:>���2�^
�I#��R2�6ҋ��e�1��P�(��,�dI�����1�F@���tw ���'���/�P�������F��M�r��|��(�"9"r��U��^dA�A��Dt��p�2�d ��G�a�V J��<t��rn�u ��t�M�:C?�L��R*����U|qW��1���A̦#Mh� �b]��h�B�U����(����X����yQc�$M�!C�~����
��$��ۑZ�!�C����L�b���(�4���3��(�����	12���	�����&�2*J��AuV>�O����� B��9����#�u\�X ��d��(��T�U�����H9� Tj%�=���{n�prM���~(֝�9�K(���%'��T�/�� l:�{�Mgr�:F�&i[��zq_�2��S��ǚ��c�!:Ԅ{b�t����S��Ev��ˇD�N,�����������@\��|L�}^�gF��q@5��rx��-��	Ԯ��yb ?tlqC���Q���^���8��C�'�;p*��t-�)FSS�.��؜A5P<�1U^)�
��b1�<�0��3�1����Ã(�(E�c:�B��69��AU���������MS�9p��*�;��<�ů�*p�t����F$��e╘=�Ʉ�䖈R:@d ����!A�I�X,@�D�-U��`|�%u�$�
@����֠�3�:{��]���gX�`���o�=�+�_yI�7�?Ɔ$�	S�v\[�iq�ߒ����C���|��V%���N��	������jg�o��R�� �N�m.�8�N�N�j2�E!�G�4:׀�䳲��D��e8D����D��'~�̆K�<-X:%n:����K��$V�vj�*��� �%����21���e����x]Խ��:m���ff�A��S|�\��әo�z�Q�������G �Kt6��J�*���`GdVY�^�	���+O&������o��3O���m� �   ��aL�X3�X׹�7�!��ܸ���(ԗʹV7W��um��2�Pz_:�"��6N��`� X�M�����|0�Ɍ��:\�e��A��>3�6���T���Aǭ!�Mc�z�$�]Y�����%��RǷ��8е(/�$E�A��@��t�4��Q2�ò�D��.�%���J��F��b�=D�t��$��<0��G�b�3��7g<_"d�/�����N�b����A��gu�$�oߥ�.Yy�sc�թ9&U&۟Y�Y<SIj�`�7,XwN΃%��q�09s@��,
aP@#C��(�=<��o�2^��7�e6�^��N�+���`�e�Wf�b��(!���-���>�_��ܕ����}�/��dd}��Շ�hKPp��BP��Z�#��\t\���|��4��d5^�ºu�M����i��#��K����5��Q�Ì��ӿ����X�
'      d   !   x�3���q�v�2��]|=��b���� t��      f      x�3�4�2�4� bK ;F��� ��      g   o  x�U�Ks�@��u�+X�4�DAw�x���\��l�@kӐ��>	VR�ͷ9U��@ޔ�@}�#�/��&�.��.L͊ևsX:κ}�M�E�[�'C{�wcj[�\�3�Ѽh3GnQ�2҈A��p��� 1 �]��4�UOE�3Q%0����S�5^$���^ס�̦��"�q�'ǮC+7S'ѳ!��
=2�1�u���S�4���_R�u�A���65���>2��d{�tU+^1���h��l�	}j���V�zA������wP�8a'<P�@$�!?�t��_�{�*6��mP�M_��r�9n����Ԟ2յ��O����_�����C7Q�,3��@��8V8D�����_���^���6�L      i   0   x�K��4�443���L.�w*-�4�441�
��44�4������ ǫ�      j   :   x�3���L.�w*-�,���2C�s�xA��	�*.cΰ�<0��2��b���� �R6     