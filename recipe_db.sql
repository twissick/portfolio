--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-04-06 21:00:36

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 845 (class 1247 OID 17026)
-- Name: meal_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.meal_type AS ENUM (
    'lunch',
    'dinner',
    'side',
    'dessert'
);


ALTER TYPE public.meal_type OWNER TO postgres;

--
-- TOC entry 866 (class 1247 OID 17175)
-- Name: prep; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.prep AS ENUM (
    'minced',
    'diced',
    'grated',
    'shredded',
    'sliced',
    'cubed',
    'melted',
    'crumbled',
    'rinsed',
    'chopped',
    'mashed',
    'softened',
    'packed',
    'hard-boiled'
);


ALTER TYPE public.prep OWNER TO postgres;

--
-- TOC entry 857 (class 1247 OID 17111)
-- Name: unit; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.unit AS ENUM (
    'tsp',
    'Tbsp',
    'cup',
    'pinch',
    'dash',
    'lb',
    'can',
    'clove',
    'tube',
    'oz',
    'sprig',
    'rib',
    'head',
    'strip',
    'package'
);


ALTER TYPE public.unit OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 17104)
-- Name: ingredient; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ingredient (
    id integer NOT NULL,
    ingredient_name character varying(50) NOT NULL
);


ALTER TABLE public.ingredient OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 17103)
-- Name: ingredient_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ingredient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ingredient_id_seq OWNER TO postgres;

--
-- TOC entry 3383 (class 0 OID 0)
-- Dependencies: 218
-- Name: ingredient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ingredient_id_seq OWNED BY public.ingredient.id;


--
-- TOC entry 222 (class 1259 OID 17158)
-- Name: instructions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instructions (
    recipe_id integer NOT NULL,
    instruction_id integer NOT NULL,
    instruction character varying(500) NOT NULL
);


ALTER TABLE public.instructions OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17157)
-- Name: instructions_recipe_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.instructions_recipe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.instructions_recipe_id_seq OWNER TO postgres;

--
-- TOC entry 3384 (class 0 OID 0)
-- Dependencies: 221
-- Name: instructions_recipe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.instructions_recipe_id_seq OWNED BY public.instructions.recipe_id;


--
-- TOC entry 215 (class 1259 OID 17053)
-- Name: meal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.meal (
    id integer NOT NULL,
    meal_name character varying(100) NOT NULL,
    last_made date,
    m_type public.meal_type,
    comments character varying(250),
    recipe_link character varying(255)
);


ALTER TABLE public.meal OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 17052)
-- Name: meal_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.meal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.meal_id_seq OWNER TO postgres;

--
-- TOC entry 3385 (class 0 OID 0)
-- Dependencies: 214
-- Name: meal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.meal_id_seq OWNED BY public.meal.id;


--
-- TOC entry 217 (class 1259 OID 17075)
-- Name: meal_relationship; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.meal_relationship (
    id integer NOT NULL,
    dinner_id integer NOT NULL,
    side_id integer NOT NULL
);


ALTER TABLE public.meal_relationship OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 17074)
-- Name: meal_relationship_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.meal_relationship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.meal_relationship_id_seq OWNER TO postgres;

--
-- TOC entry 3386 (class 0 OID 0)
-- Dependencies: 216
-- Name: meal_relationship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.meal_relationship_id_seq OWNED BY public.meal_relationship.id;


--
-- TOC entry 220 (class 1259 OID 17123)
-- Name: recipe_ingredient; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recipe_ingredient (
    recipe_id integer NOT NULL,
    ingredient_id integer NOT NULL,
    ing_meas real,
    ing_unit public.unit,
    ing_prep public.prep
);


ALTER TABLE public.recipe_ingredient OWNER TO postgres;

--
-- TOC entry 3203 (class 2604 OID 17107)
-- Name: ingredient id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredient ALTER COLUMN id SET DEFAULT nextval('public.ingredient_id_seq'::regclass);


--
-- TOC entry 3204 (class 2604 OID 17161)
-- Name: instructions recipe_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructions ALTER COLUMN recipe_id SET DEFAULT nextval('public.instructions_recipe_id_seq'::regclass);


--
-- TOC entry 3201 (class 2604 OID 17056)
-- Name: meal id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.meal ALTER COLUMN id SET DEFAULT nextval('public.meal_id_seq'::regclass);


--
-- TOC entry 3202 (class 2604 OID 17078)
-- Name: meal_relationship id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.meal_relationship ALTER COLUMN id SET DEFAULT nextval('public.meal_relationship_id_seq'::regclass);


--
-- TOC entry 3374 (class 0 OID 17104)
-- Dependencies: 219
-- Data for Name: ingredient; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ingredient (id, ingredient_name) FROM stdin;
1	coconut oil
2	olive oil
3	vegetable oil
4	garlic
5	ginger
6	green bell pepper
7	ground cumin
8	ground coriander
9	chili powder
10	curry powder
11	garam masala
12	salt
13	black pepper
14	lentils, red
15	vegetable broth
16	crushed tomatoes
17	coconut milk
18	almond butter
19	lemon
20	egg noodles
21	butter
22	yellow onion
23	frozen peas
24	tuna
25	condensed cream of mushroom soup
26	milk
27	shredded cheese, cheddar
28	shredded cheese, mozzarella
29	Italian sausage
30	tomato paste
31	water
32	spaghetti
33	small curd cottage cheese
34	Parmesan
35	Worcestershire sauce
36	frozen beef meatballs
37	broad egg noodles
38	sour cream
39	portobello mushrooms
40	thyme, fresh
41	thyme, dried
42	soy sauce
43	brown sugar
44	garlic powder
45	Hoagie rolls
46	provolone
47	boneless, skinless chicken breast
48	penne pasta
49	chicken broth
50	cream cheese
51	basil pesto
52	crushed red pepper
53	spinach, fresh
54	mushrooms
55	lentils, brown
56	sage, dried
57	bone-in pork chops
58	onion powder
59	cayenne pepper
60	all-purpose flour
61	heavy cream
62	pasta sauce
63	frozen vegetable blend
64	condensed cream of potato soup
65	french-fried onions
66	refrigerated crescent rolls
67	ground beef
68	rosemary, dried
69	rosemary, fresh
70	beef broth
71	frozen mixed peas and carrots
72	frozen corn
73	russet potatoes
74	celery salt
75	stew meat
76	cabernet sauvignon
77	beef bouillon
78	carrots
79	Yukon gold potatoes
80	mayonnaise
81	panko crumbs
82	lasagna noodles
83	Italian seasoning
84	ricotta cheese
85	egg
86	broccoli
87	bell pepper, yellow
88	bell pepper, green
89	bell pepper, red
90	baby carrots
91	corn starch
92	honey
93	sesame oil
94	red pepper flakes
95	shrimp
96	fettucine
97	long grain white rice
98	jasmine rice
99	Cajun seasoning
100	elbow macaroni
101	half and half
102	shredded cheese, Gruyere
103	paprika
104	zucchini
105	scallions
106	Greek yogurt
107	allspice
108	ground cloves
109	lentils, green
110	celery
111	pork shoulder roast
112	BBQ sauce
113	vinegar, apple cider
114	vinegar, white
115	yellow mustard
116	cabbage
117	smoked sausage
118	baby potatoes
119	basil, dried
120	basil, fresh
121	parsley, dried
122	parsley, fresh
123	Velveeta cheese
124	turmeric
125	boneless, skinless chicken thighs
126	prepared double pie crust
127	granulated sugar
128	kidney beans, red
129	kidney beans, white
130	tomato sauce
131	chuck beef
132	pearl onions
133	bacon
134	white potatoes
135	cooked ham
136	baking soda
137	baking powder
138	ground cinnamon
139	ground nutmeg
140	pumpkin puree
141	vanilla extract
142	powdered sugar
143	vinegar, red wine
144	lemon juice
145	Dijon mustard
146	Cannellini beans
147	red onion
148	lime
149	vinegar, balsamic
150	black eyed peas
151	Roma tomatoes
152	jalapeno
153	peaches
154	banana
155	butternut squash
156	tofu, extra firm
157	short grain brown rice
158	chili garlic sauce
159	bowtie pasta
160	gnocchi
161	vinegar, rice
162	sugar snap peas
163	lemon zest
164	water, warm
165	water, cold
166	instant yeast
167	pepperoni
168	marinara sauce
169	green beans
170	quinoa
171	lime juice
172	green onion
173	craisins
174	spicy brown mustard
175	cauliflower
176	cashews
177	taco seasoning
178	tortillas, flour
179	nacho cheese
180	tostada shells
181	lettuce
182	shredded cheese, Mexican blend
183	red potatoes
184	cucumber
185	chickpeas
186	plain yogurt
187	gravy mix, chicken
188	salami
189	ketchup
190	Brussels sprouts
191	pita bread
192	turkey, sliced
193	hummus, red pepper
194	cocoa powder
195	chocolate chips
196	applesauce, unsweetened
197	ground ginger
198	pineapple, crushed
199	cottage cheese
200	jam, strawberry
201	milk, warm
\.


--
-- TOC entry 3377 (class 0 OID 17158)
-- Dependencies: 222
-- Data for Name: instructions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.instructions (recipe_id, instruction_id, instruction) FROM stdin;
1	1	Rinse the lentils in cold water until the water runs clear.
1	2	Heat a large, deep skillet or large saucepan over medium-high heat and add the coconut oil. Once the oil is shimmering, add the garlic, ginger, fresh turmeric (if using), and Serrano pepper and cook for 2 minutes, stirring frequently to prevent garlic from burning.
1	3	Add the cumin, coriander, chili powder, curry powder, garam masala, salt, and black pepper to taste, and cook for 30 to 60 seconds until fragrant, tossing frequently to prevent burning. If using ground turmeric instead of fresh turmeric, add the ground turmeric now, along the the rest of the spices.
1	4	Pour in the vegetable broth, and use a wooden spoon or spatula to scrape up any browned bits on the bottom of the pot. Add in the lentils and the crushed tomatoes and mix well. Reduce the heat to low and cover the pan with a lid. Simmer for 20 to 25 minutes, or until the lentils are cooked through and have mostly softened. If you find that the lentils are not quite soft after 25 minutes, add a few spoons more of broth or water and cook for another 5 minutes.
1	5	Remove the lid and stir in the coconut milk, almond butter, along with salt and pepper to taste Continue cooking on low heat, uncovered for 5 to 8 minutes, until the curry has thickened and is creamy.
1	6	Finally, stir in the lemon juice and cilantro, and turn off the heat. If you want your lentils to even creamier and more on the puréed side, use an immersion blender to lightly purée the curry.
1	7	Serve the curry with rice and/or Indian flatbread and garnish with additional cilantro. Store leftovers in the fridge for 3-4 days.
2	1	Preheat oven to 425°F. Combine topping ingredients and set aside.
2	2	Boil noodles al dente according to package directions. Drain and rinse under cold water.
2	3	Cook onion and celery in butter until tender, about 5-7 minutes.
2	4	In a large bowl combine noodles, onion mixture, peas, soup, milk, cheese, tuna and parsley. Mix well.
2	5	Spread into a 2qt casserole dish and top with crumb topping (panko crumbs, 1/2 cup cheese, 1 Tbsp butter).
2	6	Bake 18-20 minutes or until bubbly.
3	1	Dice the onion and mince the garlic.
3	2	Add the olive oil to a large skillet and heat over medium. Add the Italian sausage and cook until browned.
3	3	Add the chopped onion and minced garlic to the skillet and continue to stir and cook until the onions are soft and translucent.
3	4	Add the tomato paste, crushed tomatoes, Italian seasoning, salt, and water. Stir to combine, then allow the sauce to come up to a simmer. Reduce the heat to medium-low and let the sauce simmer while you cook the pasta.
3	5	Preheat the oven to 350 degrees. Add ½ Tbsp salt to a large pot of water and bring it to a boil over high heat. Add the spaghetti and continue to boil until the pasta is tender, but not fully cooked. Drain the pasta in a colander.
3	6	Add the drained pasta to the sauce and stir to combine.
3	7	Combine the cottage cheese, Parmesan, and pepper in a bowl.
3	8	Lightly grease an 8×11" casserole dish. Layer in half of the spaghetti and sauce, then top with the cottage cheese mixture. Add the second half of the spaghetti and sauce, then top with the shredded mozzarella.
3	9	Cover the dish with foil then bake the spaghetti for 30 minutes. Top the spaghetti with chopped parsley, if desired. Slice into six pieces, then serve!
4	1	Heat oil in a large skillet over medium-high heat. Add onion and garlic; cook and stir until onion is almost soft, about 3 minutes.
4	2	Reduce heat to medium; stir in condensed soup, milk, and Worcestershire sauce. Add meatballs; reduce heat to low and simmer, covered, until tender, 35 to 40 minutes.
4	3	Meanwhile, bring a large pot of lightly salted water to a boil. Add noodles and cook, stirring occasionally, until tender yet firm to the bite, 10 to 12 minutes; drain.
4	4	Add sour cream, salt, and pepper to meatballs in sauce. Cook until flavors combine, about 2 minutes. Serve meatballs over noodles.
52	1	Combine together the water, sugar and yeast. Let sit for 5-10 minutes or until the mixture begins to bubble on top
52	2	Add in the milk, yogurt, oil, minced garlic, flour baking powder and salt. Mix until the dough comes together with your hands.
52	3	Turn dough out onto lightly floured surface. Use floured hands to knead the dough until smooth, about 3 to 5 minutes.
52	4	Lightly grease the same mixing bowl with a small spray of cooking oil. Transfer dough to the bowl and cover with plastic wrap. Let rest at room temperature for about an hour until doubled in size.
52	5	When ready to cook, divide the dough into 10 equal pieces. Roll into balls, then use a rolling pin to roll each piece of dough into a large oval, about 6-inches long and 1/8-inch thick. Repeat with remaining dough.
52	6	Heat a large cast iron skillet over medium-high heat. Grease skillet all over with 1/2 teaspoon of the extra oil.
52	7	Place one piece of the naan on the oiled hot skillet and cook until bubbles form on top, about 1-2 minutes. While cooking, brush the top with a little oil.
52	8	Flip and cook for another 1-2 minutes, until large golden spots appear on the bottom.
52	9	Remove from the skillet and wrap in a clean kitchen towel. Repeat with the remaining naan (keep them wrapped in a towel while you work).
52	10	Combine melted butter and minced garlic (2 cloves) together in a bowl. Brush each naan with the garlic butter and top with the fresh herb of your choosing.
72	1	Slice all your veggies as you like them. Arrange the hummus on a large cutting board or serving tray and layer in the veggies as they'll fit. 
72	2	Serve and enjoy!
34	1	Preheat oven to 350° F. Grease baking sheets.
34	2	Combine flour, baking soda, baking powder, cinnamon, nutmeg and salt in medium bowl. Beat sugar and 1/2 cup (1 stick) butter in large mixer bowl until well blended. Beat in pumpkin, egg and 1 teaspoon vanilla extract until smooth. Gradually beat in flour mixture. Drop by rounded tablespoon onto prepared baking sheets.
34	3	Bake for 15 to 18 minutes or until edges are firm. Cool on baking sheets for 2 minutes; remove to wire racks to cool completely.
34	4	Combine sifted powdered sugar, milk, 1 tablespoon butter and remaining 1 teaspoon vanilla extract in small bowl until smooth. Drizzle over cookies.
\.


--
-- TOC entry 3370 (class 0 OID 17053)
-- Dependencies: 215
-- Data for Name: meal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.meal (id, meal_name, last_made, m_type, comments, recipe_link) FROM stdin;
1	Lentil Curry	\N	dinner	\N	https://rainbowplantlife.com/vegan-red-lentil-curry/
2	Tuna Casserole	\N	dinner	\N	https://www.spendwithpennies.com/easy-tuna-casserole/
3	Baked Spaghetti	\N	dinner	\N	https://www.budgetbytes.com/baked-spaghetti-with-sausage/
4	Crockpot Cream of Mushroom Noodles and Meatballs	\N	dinner	\N	https://www.allrecipes.com/recipe/254328/quick-meatball-stroganoff/
5	Vegetarian French Dip Sandwiches	\N	dinner	\N	https://www.budgetbytes.com/vegetarian-french-dip-sandwiches/
6	One Pot Creamy Pesto Chicken	\N	dinner	\N	https://www.budgetbytes.com/one-pot-creamy-pesto-chicken-pasta/
7	Lentils with Creamy Mushroom Gravy	\N	dinner	\N	https://www.budgetbytes.com/lentils-with-creamy-mushroom-gravy/
8	Smothered Pork Chops	\N	dinner	\N	https://cafedelites.com/smothered-pork-chops/#recipe
9	Spaghetti and Meatballs	\N	dinner	\N	https://natashaskitchen.com/spaghetti-and-meatballs-recipe/
10	Lattice-Top Chicken Stew	\N	dinner	\N	https://www.tasteofhome.com/recipes/lattice-top-chicken-stew/
11	Shepherd's Pie	\N	dinner	\N	https://www.thewholesomedish.com/the-best-classic-shepherds-pie/#recipe
12	Slow Cooker Beef Stew	\N	dinner	\N	https://thecozycook.com/slow-cooker-beef-stew/
13	Mayo Parmesan Baked Chicken	\N	dinner	\N	https://centslessdeals.com/parmesan-crusted-mayonnaise-chicken/
14	Cheesy Chicken	\N	dinner	\N	https://www.plainchicken.com/chicken-roll-ups/
15	Lasagna	\N	dinner	\N	https://www.spendwithpennies.com/easy-homemade-lasagna/
16	Stir Fry	\N	dinner	\N	https://www.momontimeout.com/easy-chicken-stir-fry-recipe/#recipe
17	Shrimp Alfredo	\N	dinner	\N	budgetbytes.com/shrimp-alfredo-pasta/
18	One Pot Lemon Garlic Shrimp and Rice	\N	dinner	\N	https://www.budgetbytes.com/one-pot-lemon-garlic-shrimp-and-rice/
19	Mac and Cheese	\N	dinner	\N	https://www.thechunkychef.com/family-favorite-baked-mac-and-cheese/#wprm-recipe-container-9151
20	Garlic Parmesan Zucchini Fritters	\N	lunch	\N	https://www.eatwell101.com/zucchini-fritters-recipe
21	Mujaddara	\N	dinner	\N	https://www.budgetbytes.com/mujaddara/
22	Slow Cooker Chicken Noodle Soup	\N	dinner	\N	https://www.budgetbytes.com/slow-cooker-chicken-noodle-soup/
23	Pulled Pork	\N	dinner	\N	https://www.allrecipes.com/recipe/92462/slow-cooker-texas-pulled-pork/
24	Slow Cooker Cabbage and Sausage	\N	dinner	\N	https://www.budgetbytes.com/slow-cooker-cabbage-and-sausage/
25	Cheeseburger Stew	\N	dinner	\N	https://therecipecritic.com/cheeseburger-soup/
26	Slow Cooker Chicken Tikka Masala	\N	dinner	\N	https://www.budgetbytes.com/slow-cooker-chicken-tikka-masala/
27	Chicken Pot Pie	\N	dinner	\N	https://www.budgetbytes.com/chicken-pot-pie/
28	Creamy Chicken and Rice Skillet	\N	dinner	\N	https://www.budgetbytes.com/creamy-chicken-and-rice-skillet/
29	Goulash	\N	dinner	\N	https://www.delish.com/cooking/recipe-ideas/a55501/best-goulash-recipe/
30	Chili	\N	dinner	\N	https://www.thewholesomedish.com/the-best-classic-chili/#recipe
31	Beef Burgundy	\N	dinner	\N	https://www.recipetineats.com/beef-bourguignon-beef-burgundy/
32	Ketchup and Mustard Baked Pork Chops	\N	dinner	\N	https://amandacooksandstyles.com/mustard-brown-sugar-pork-chops/
33	Scalloped Potatoes and Ham	\N	dinner	\N	https://www.spendwithpennies.com/scalloped-potatoes-and-ham/#wprm-recipe-container-147266
34	Pumpkin Cookies	\N	dessert	\N	https://www.verybestbaking.com/libbys/recipes/old-fashioned-soft-pumpkin-cookies/
35	Lemony White Bean Salad	\N	side	\N	https://www.budgetbytes.com/lemony-white-bean-salad/
36	Cowboy Caviar	\N	side	\N	https://www.budgetbytes.com/cowboy-caviar/
37	Peach Galette	\N	dessert	\N	https://www.budgetbytes.com/peach-galette/
38	Baked Zucchini	\N	lunch	\N	https://www.cookingclassy.com/baked-zucchini/
39	Roast Cauliflower	\N	lunch	\N	https://natashaskitchen.com/roasted-cauliflower/#jump-to-recipe
40	Banana Bread	\N	dessert	\N	https://www.simplyrecipes.com/recipes/banana_bread/
41	Roast Butternut Squash	\N	lunch	\N	https://www.allrecipes.com/recipe/229733/simple-roasted-butternut-squash/
42	Vegan Fried Rice	\N	lunch	\N	https://minimalistbaker.com/easy-vegan-fried-rice/#wprm-recipe-container-35513
43	Parmesan Spinach Mushroom Pasta	\N	dinner	\N	https://www.eatwell101.com/parmesan-spinach-mushroom-pasta-skillet-recipe
44	Garlic Butter Mushrooms and Gnocchi	\N	lunch	\N	https://www.eatwell101.com/foil-packets-garlic-butter-mushroom-and-gnocchi
45	Mushroom Cousous	\N	lunch	\N	https://eatsomethingvegan.com/mushroom-couscous/#recipe
46	Over Roasted Potatoes	\N	lunch	\N	https://platedcravings.com/oven-roasted-potatoes/
47	Roasted Carrots with Herbed Yogurt Sauce	\N	lunch	\N	https://newengland.com/today/roasted-carrots-with-herbed-yogurt-sauce/
48	Chicken Fried Rice	\N	lunch	\N	https://www.delish.com/cooking/recipe-ideas/a25635966/chicken-fried-rice-recipe/
49	Herb Baked Chicken Breast	\N	dinner	\N	https://downshiftology.com/recipes/herb-baked-chicken-breast/
50	Garlic Smashed Potatoes	\N	side	\N	https://www.delish.com/cooking/recipe-ideas/recipes/a49007/garlic-smashed-potatoes-recipe/
51	Shrimp and Sugar Snap Peas	\N	lunch	\N	https://www.asweetpeachef.com/shrimp-meal-prep/#wprm-recipe-container-29109
52	Cheesy Garlic Naan	\N	side	\N	https://cafedelites.com/buttery-garlic-naan-recipe/#recipe
53	Pepperoni Chicken	\N	dinner	\N	https://www.thepioneerwoman.com/food-cooking/recipes/a80295/pepperoni-chicken/
54	Slow Cooker Green Beans with Bacon	\N	side	\N	https://www.momontimeout.com/slow-cooker-green-beans-bacon-recipe/#recipe
55	Quinoa and Black Bean Salad	\N	side	\N	https://detoxinista.com/the-best-quinoa-black-bean-salad/#wprm-recipe-container-27514
56	Sweet and Crunch Carrot Salad	\N	side	\N	https://detoxinista.com/carrot-salad/#wprm-recipe-container-33897
57	Cauliflower Fried Rice	\N	lunch	\N	https://www.onceuponachef.com/recipes/cauliflower-fried-rice.html#tabrecipe
58	Crunch Wrap Supreme	\N	dinner	\N	https://damndelicious.net/2017/01/11/homemade-crunch-wrap-supreme/
59	German Potato Salad	\N	side	\N	https://www.platingsandpairings.com/german-potato-salad/?fbclid=IwAR20TDaYusiajWYXmpnGYA2HFIB5uH3kZxKIlsH9aRPZh_JqhP5NK5VQuyo#recipe
60	Chicken Lentil Soup	\N	dinner	\N	https://momsdish.com/chicken-lentil-soup#jump-to-recipe
61	Chickpea Quinoa Salad	\N	side	\N	https://www.eatwell101.com/chickpea-quinoa-salad-recipe
62	Butter Chicken	\N	dinner	\N	https://cafedelites.com/butter-chicken/#recipe
63	Crockpot Chicken and Gravy	\N	dinner	\N	https://www.thisisnotdietfood.com/crock-pot-chicken-and-gravy/?utm_source=webstory&utm_medium=story&utm_id=crockpotchickenandgravystory&_gl=1*1rsdwtl*_ga*dzkydHZuMW1tYWZVdVg4dlhuamkzTjZBbTNhZlZLRUdYc2RWWG80VlJ6SlF0bmtESVhSS05iSkg0aTdYdkpHNw
64	Calzone	\N	dinner	\N	https://natashaskitchen.com/easy-calzone-recipe/
65	Foccacia	\N	side	\N	https://www.recipetineats.com/focaccia-recipe/#wprm-recipe-container-59032
66	Korean Spicy Tofu	\N	lunch	\N	https://simpleveganblog.com/korean-style-spicy-tofu/#recipe
67	Fresh Baked Bread	\N	side	\N	https://www.allrecipes.com/recipe/17215/best-bread-machine-bread/
68	Meatloaf	\N	dinner	\N	https://natashaskitchen.com/meatloaf-recipe/
69	Roasted Brussels Sprouts	\N	side	\N	https://www.foodnetwork.com/recipes/ina-garten/roasted-brussels-sprouts-recipe2-1941953
70	Chicken Pita Pockets	\N	lunch	\N	https://www.tasteofhome.com/recipes/chicken-pita-pockets/
71	Turkey Club Sandwich	\N	lunch	\N	https://boarshead.com/recipes/detail/38-classic-turkey-club
72	Veggies with Hummus	\N	side	\N	https://www.thecookierookie.com/hummus-and-vegetable-board/
73	Steamed Veggie Medley	\N	side	\N	https://www.ourlifetastesgood.com/2015/08/steamed-vegetables-with-garlic-butter.html
74	Zucchini Goulash	\N	lunch	\N	https://iamhomesteader.com/summer-goulash/#wprm-recipe-container-67929
75	Brownies	\N	dessert	\N	https://www.loveandlemons.com/brownies-recipe/
76	Chocolate Chip Cookies	\N	dessert	\N	https://joyfoodsunshine.com/the-most-amazing-chocolate-chip-cookies/
77	Carrot Cake	\N	dessert	\N	https://sallysbakingaddiction.com/my-favorite-carrot-cake-recipe/
78	Pineapple Cookies	\N	dessert	\N	https://copykat.com/frosted-pineapple-cookies/
79	Macaroni Salad	\N	side	\N	https://sugarspunrun.com/macaroni-salad/#recipe
80	Potato Salad	\N	side	\N	https://www.aspicyperspective.com/make-best-potato-salad-recipe/
81	Cottage Cheese w/ Jam and Fruit	\N	side	\N	https://www.food.com/recipe/tasty-dishs-cottage-cheese-snack-251127
\.


--
-- TOC entry 3372 (class 0 OID 17075)
-- Dependencies: 217
-- Data for Name: meal_relationship; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.meal_relationship (id, dinner_id, side_id) FROM stdin;
1	1	52
2	1	72
\.


--
-- TOC entry 3375 (class 0 OID 17123)
-- Dependencies: 220
-- Data for Name: recipe_ingredient; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recipe_ingredient (recipe_id, ingredient_id, ing_meas, ing_unit, ing_prep) FROM stdin;
1	1	1	Tbsp	\N
1	4	4	clove	minced
1	124	1	Tbsp	\N
1	5	1	Tbsp	minced
1	7	1	tsp	\N
1	8	0.5	tsp	\N
1	9	1	tsp	\N
1	10	2	tsp	\N
1	11	1	tsp	\N
1	12	1	dash	\N
1	13	1	pinch	\N
1	14	1	cup	\N
1	15	2	cup	\N
1	16	1	can	\N
1	17	13.5	oz	\N
1	19	0.5	\N	\N
2	20	2	cup	\N
2	21	2	Tbsp	\N
2	22	1	\N	\N
2	23	0.66	cup	\N
2	25	10.5	oz	\N
2	27	1.5	cup	\N
2	26	0.33	cup	\N
2	81	0.5	cup	\N
3	22	1	\N	\N
3	4	3	clove	\N
3	2	1	Tbsp	\N
3	29	0.5	lb	\N
3	30	3	oz	\N
3	16	28	oz	\N
3	83	0.5	tsp	\N
3	12	0.5	tsp	\N
3	31	0.5	cup	\N
3	32	12	oz	\N
3	33	1	cup	\N
3	34	0.25	cup	grated
3	13	0.5	tsp	\N
3	28	1	cup	\N
4	3	1	Tbsp	\N
4	22	0.5	\N	chopped
4	25	10.5	oz	\N
4	26	0.5	cup	\N
4	35	1	Tbsp	\N
4	36	15	\N	\N
4	20	8	oz	\N
4	38	0.75	cup	\N
52	164	0.25	cup	\N
52	127	2	tsp	\N
52	166	1.5	tsp	\N
52	201	0.75	cup	\N
52	106	0.75	cup	\N
52	3	0.25	cup	\N
52	4	4	clove	\N
52	60	4	cup	\N
52	137	1	tsp	\N
52	12	1	tsp	\N
52	21	3	Tbsp	melted
72	193	8	oz	\N
72	90	1	lb	\N
72	184	1	\N	\N
72	175	1	lb	\N
72	86	1	lb	\N
34	60	2.5	cup	\N
34	136	1	tsp	\N
34	137	1	tsp	\N
34	138	1	tsp	\N
34	139	0.5	tsp	\N
34	12	0.5	tsp	\N
34	127	1.5	cup	\N
34	21	0.5	cup	softened
34	140	1	cup	\N
34	85	1	\N	\N
34	141	2	tsp	\N
34	142	2	cup	\N
34	26	3	Tbsp	\N
\.


--
-- TOC entry 3387 (class 0 OID 0)
-- Dependencies: 218
-- Name: ingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ingredient_id_seq', 201, true);


--
-- TOC entry 3388 (class 0 OID 0)
-- Dependencies: 221
-- Name: instructions_recipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.instructions_recipe_id_seq', 1, false);


--
-- TOC entry 3389 (class 0 OID 0)
-- Dependencies: 214
-- Name: meal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.meal_id_seq', 81, true);


--
-- TOC entry 3390 (class 0 OID 0)
-- Dependencies: 216
-- Name: meal_relationship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.meal_relationship_id_seq', 2, true);


--
-- TOC entry 3212 (class 2606 OID 17109)
-- Name: ingredient ingredient_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredient
    ADD CONSTRAINT ingredient_pkey PRIMARY KEY (id);


--
-- TOC entry 3217 (class 2606 OID 17163)
-- Name: instructions instructions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructions
    ADD CONSTRAINT instructions_pkey PRIMARY KEY (recipe_id, instruction_id);


--
-- TOC entry 3206 (class 2606 OID 17058)
-- Name: meal meal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.meal
    ADD CONSTRAINT meal_pkey PRIMARY KEY (id);


--
-- TOC entry 3208 (class 2606 OID 17082)
-- Name: meal_relationship meal_relationship_dinner_id_side_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.meal_relationship
    ADD CONSTRAINT meal_relationship_dinner_id_side_id_key UNIQUE (dinner_id, side_id);


--
-- TOC entry 3210 (class 2606 OID 17080)
-- Name: meal_relationship meal_relationship_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.meal_relationship
    ADD CONSTRAINT meal_relationship_pkey PRIMARY KEY (id);


--
-- TOC entry 3214 (class 2606 OID 17214)
-- Name: recipe_ingredient recipe_id_ingredient_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipe_ingredient
    ADD CONSTRAINT recipe_id_ingredient_id_unique UNIQUE (recipe_id, ingredient_id);


--
-- TOC entry 3219 (class 2606 OID 17173)
-- Name: instructions uc_recipe; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructions
    ADD CONSTRAINT uc_recipe UNIQUE (recipe_id, instruction_id);


--
-- TOC entry 3215 (class 1259 OID 17208)
-- Name: recipe_ingredient_recipe_id_ingredient_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX recipe_ingredient_recipe_id_ingredient_id_key ON public.recipe_ingredient USING btree (recipe_id, ingredient_id);


--
-- TOC entry 3220 (class 2606 OID 17093)
-- Name: meal_relationship fk_dinner_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.meal_relationship
    ADD CONSTRAINT fk_dinner_id FOREIGN KEY (dinner_id) REFERENCES public.meal(id) ON DELETE CASCADE;


--
-- TOC entry 3224 (class 2606 OID 17135)
-- Name: recipe_ingredient fk_ingredient_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipe_ingredient
    ADD CONSTRAINT fk_ingredient_id FOREIGN KEY (ingredient_id) REFERENCES public.ingredient(id) ON DELETE CASCADE;


--
-- TOC entry 3225 (class 2606 OID 17130)
-- Name: recipe_ingredient fk_recipe_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipe_ingredient
    ADD CONSTRAINT fk_recipe_id FOREIGN KEY (recipe_id) REFERENCES public.meal(id) ON DELETE CASCADE;


--
-- TOC entry 3226 (class 2606 OID 17164)
-- Name: instructions fk_recipe_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructions
    ADD CONSTRAINT fk_recipe_id FOREIGN KEY (recipe_id) REFERENCES public.meal(id) ON DELETE CASCADE;


--
-- TOC entry 3221 (class 2606 OID 17098)
-- Name: meal_relationship fk_side_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.meal_relationship
    ADD CONSTRAINT fk_side_id FOREIGN KEY (side_id) REFERENCES public.meal(id) ON DELETE CASCADE;


--
-- TOC entry 3222 (class 2606 OID 17083)
-- Name: meal_relationship meal_relationship_dinner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.meal_relationship
    ADD CONSTRAINT meal_relationship_dinner_id_fkey FOREIGN KEY (dinner_id) REFERENCES public.meal(id);


--
-- TOC entry 3223 (class 2606 OID 17088)
-- Name: meal_relationship meal_relationship_side_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.meal_relationship
    ADD CONSTRAINT meal_relationship_side_id_fkey FOREIGN KEY (side_id) REFERENCES public.meal(id);


-- Completed on 2023-04-06 21:00:36

--
-- PostgreSQL database dump complete
--

