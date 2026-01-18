local M = {}

M.lista = {
    { "El secreto de la existencia humana no solo está en vivir, sino en saber para qué se vive.", "Fiódor Dostoyevski" },
    { "Uno va madurando y supera los ideales anteriores, que se reducen a polvo y a escombros; y cuando se carece de otra vida, tiene uno que edificarla con esos mismos escombros", "Fiódor Dostoyevski" },
    { "Es mejor equivocarse siguiendo tu propio camino que tener razón siguiendo el de otro.", "Fiódor Dostoyevski" },
    { "La belleza salvará al mundo.", "Fiódor Dostoyevski" },
    { "Quien tiene un porqué para vivir puede soportar casi cualquier cómo.", "Friedrich Nietzsche" },
    { "Lo que no me mata, me hace más fuerte.", "Friedrich Nietzsche" },
    { "El hombre es el único animal que rinde culto a su propia infelicidad.", "Emil Cioran" },
    { "Solo se empieza a vivir cuando se ha comprendido que la vida no tiene sentido.", "Emil Cioran" },
    { "El hombre nace libre, responsable y sin excusas.", "Jean-Paul Sartre" },
    { "Vivir es sufrir; sobrevivir es hallar algo de sentido en el sufrimiento.", "Viktor Frankl" },
    { "En medio del invierno, aprendí por fin que había en mí un verano invencible.", "Albert Camus" },
    { "No se nace mujer: llega una a serlo.", "Simone de Beauvoir" },
    { "La libertad es lo que haces con lo que te han hecho.", "Jean-Paul Sartre" },
    { "El grado de civilización de una sociedad se mide entrando en sus cárceles.", "Fiódor Dostoyevski" },
    { "El hombre es una criatura que se acostumbra a todo.", "Fiódor Dostoyevski" },
    { "Mucho pensamiento y poca vida, eso es lo que nos mata.", "Fiódor Dostoyevski" },
    { "Si quieres vencer al mundo, véncete a ti mismo.", "Fiódor Dostoyevski" },
    { "La mayor felicidad es conocer la fuente de la infelicidad.", "Fiódor Dostoyevski" },
    { "Amo a la humanidad, pero menos amo a los hombres en particular.", "Fiódor Dostoyevski" },
    { "El verdadero dolor, el que nos hace sufrir profundamente, hace a veces serio y constante hasta al hombre irreflexivo.", "Fiódor Dostoyevski" },
    { "Hermanos, no tengáis miedo de los pecados de los hombres, amad al hombre incluso en su pecado.", "Fiódor Dostoyevski" },
    { "La gente habla a veces de la crueldad 'bestial' del hombre, pero eso es una terrible injusticia para las bestias.", "Fiódor Dostoyevski" },
    { "Todo pasa, solo la verdad permanece.", "Fiódor Dostoyevski" },
    { "Sin música, la vida sería un error.", "Friedrich Nietzsche" },
    { "El hombre es una cuerda tendida entre la bestia y el superhombre.", "Friedrich Nietzsche" },
    { "La esperanza es el peor de los males, pues prolonga el tormento del hombre.", "Friedrich Nietzsche" },
    { "Aquel que tiene un porqué para vivir se puede enfrentar a todos los 'cómos'.", "Friedrich Nietzsche" },
    { "Los que bailaban eran considerados locos por aquellos que no podían oír la música.", "Friedrich Nietzsche" },
    { "No que me hayas mentido, sino que ya no te crea, eso es lo que me aterra.", "Friedrich Nietzsche" },
    { "En el amor siempre hay algo de locura, mas en la locura siempre hay algo de razón.", "Friedrich Nietzsche" },
    { "La madurez del hombre es haber vuelto a encontrar la seriedad con la que jugaba cuando era niño.", "Friedrich Nietzsche" },
    { "Donde no se puede amar más, ¡hay que pasar de largo!", "Friedrich Nietzsche" },
    { "El absurdo nace de la confrontación entre la búsqueda del hombre y el silencio del mundo.", "Albert Camus" },
    { "No ser amado es una simple desventura; la verdadera desgracia es no amar.", "Albert Camus" },
    { "Me rebelo, luego somos.", "Albert Camus" },
    { "La capacidad de atención del hombre es limitada y debe ser constantemente estimulada.", "Albert Camus" },
    { "El otoño es una segunda primavera donde cada hoja es una flor.", "Albert Camus" },
    { "Incluso en el barro, siempre busqué el cielo.", "Albert Camus" },
    { "Aceptar la absurdidad de todo lo que nos rodea es un paso, una experiencia necesaria.", "Albert Camus" },
    { "Todas las desgracias de los hombres provienen de no hablar claro.", "Albert Camus" },
    { "Nadie realiza que algunas personas gastan una energía tremenda simplemente para ser normales.", "Albert Camus" },
    { "La lucha hacia las cumbres basta para llenar el corazón de un hombre. Hay que imaginar a Sísifo dichoso.", "Albert Camus" },
    { "Estar vivo es perder terreno.", "Emil Cioran" },
    { "No corremos hacia la muerte; huimos del desastre del nacimiento.", "Emil Cioran" },
    { "Solo los optimistas se suicidan, los optimistas que ya no pueden serlo.", "Emil Cioran" },
    { "La conciencia es mucho más que una espina, es la daga en la carne.", "Emil Cioran" },
    { "La timidez es un desprecio que no se atreve a decir su nombre.", "Emil Cioran" },
    { "Toda idea debería nacer de una herida; nadie debería escribir si no es para decir cosas que los demás no se atreverían a confiar ni a su propia sombra.", "Emil Cioran" },
    { "El derecho a elegir el momento de la partida es la única forma de libertad que nos queda.", "Emil Cioran" },
    { "Sufrir es la única manera de adquirir la sensación de existir.", "Emil Cioran" },
    { "Escribo para no pasar a la acción, para no destruirme.", "Emil Cioran" },
    { "La vida es un negocio cuyos beneficios no cubren ni de lejos los gastos.", "Arthur Schopenhauer" },
    { "El hombre puede hacer lo que quiera, pero no puede querer lo que quiera.", "Arthur Schopenhauer" },
    { "La soledad es el destino de todos los espíritus excelentes.", "Arthur Schopenhauer" },
    { "La salud no lo es todo, pero sin ella, todo lo demás es nada.", "Arthur Schopenhauer" },
    { "Cada partida es una anticipación de la muerte y cada encuentro una anticipación de la resurrección.", "Arthur Schopenhauer" },
    { "El destino baraja las cartas, nosotros las jugamos.", "Arthur Schopenhauer" },
    { "Difícilmente se encuentra la felicidad dentro de uno mismo, pero es imposible encontrarla en otro lugar.", "Arthur Schopenhauer" },
    { "La brevedad de la vida, de la que tanto nos quejamos, puede que sea lo mejor de ella.", "Arthur Schopenhauer" },
    { "El aburrimiento es la sensación de la vacuidad de la existencia.", "Arthur Schopenhauer" },
    { "La literatura es siempre una expedición a la verdad.", "Franz Kafka" },
    { "A partir de cierto punto, no hay retorno. Ese es el punto que hay que alcanzar.", "Franz Kafka" },
    { "Un libro debe ser el hacha que rompa el mar helado dentro de nosotros.", "Franz Kafka" },
    { "La juventud es feliz porque tiene la capacidad de ver la belleza. Cualquiera que conserve la capacidad de ver la belleza nunca envejece.", "Franz Kafka" },
    { "Soy una jaula en busca de un pájaro.", "Franz Kafka" },
    { "La fe en el progreso no significa que el progreso ya haya ocurrido.", "Franz Kafka" },
    { "El sentido de la vida es que termina.", "Franz Kafka" },
    { "A menudo es más seguro estar encadenado que libre.", "Franz Kafka" },
    { "No desesperes, ni siquiera por el hecho de que no desesperas.", "Franz Kafka" },
    { "El hombre está condenado a ser libre.", "Jean-Paul Sartre" },
    { "El infierno son los otros.", "Jean-Paul Sartre" },
    { "Incluso si no elegimos, estamos eligiendo no elegir.", "Jean-Paul Sartre" },
    { "Lo importante no es lo que han hecho de nosotros, sino lo que hacemos con lo que han hecho de nosotros.", "Jean-Paul Sartre" },
    { "La existencia precede a la esencia.", "Jean-Paul Sartre" },
    { "Aquel que ve su propia vida como un proyecto, es libre.", "Jean-Paul Sartre" },
    { "Un amor, una carrera, una revolución: otras tantas empresas que se comienzan sin saber su desenlace.", "Simone de Beauvoir" },
    { "El hombre no es nada más que su proyecto.", "Jean-Paul Sartre" },
    { "La vida solo puede ser comprendida hacia atrás, pero debe ser vivida hacia adelante.", "Sören Kierkegaard" },
    { "La angustia es el vértigo de la libertad.", "Sören Kierkegaard" },
    { "Atreverse es perder el pie momentáneamente. No atreverse es perderse a uno mismo.", "Sören Kierkegaard" },
    { "La gente me entiende tan poco que ni siquiera entienden mis quejas de que no me entienden.", "Sören Kierkegaard" },
    { "Lo más común de los hombres es que se olviden de sí mismos.", "Sören Kierkegaard" },
    { "El yo no es algo que es, sino algo que debe ser.", "Sören Kierkegaard" },
    { "Llevo sobre mí todas las heridas del mundo.", "Fernando Pessoa" },
    { "Mi alma es una orquesta oculta; no sé qué instrumentos tañen y rechinen dentro de mí.", "Fernando Pessoa" },
    { "Vivir es pertenecer a otro. Morir es pertenecer a nadie.", "Fernando Pessoa" },
    { "La literatura es la manera más agradable de ignorar la vida.", "Fernando Pessoa" },
    { "Todo lo que amamos es un punto de partida para perderlo.", "Cesare Pavese" },
    { "Vendrá la muerte y tendrá tus ojos.", "Cesare Pavese" },
    { "El único placer de estar vivo es saber que mañana podrías no estarlo.", "Cesare Pavese" },
    { "Solo los muertos saben lo que es estar vivo.", "Antonio Machado" },
    { "La vida es una serie de colisiones con el futuro.", "José Ortega y Gasset" },
    { "Aquel que cree que su vida tiene sentido, está loco; aquel que cree que no lo tiene, está desesperado.", "Miguel de Unamuno" },
    { "Jamás desesperes, pero si desesperas, sigue trabajando en la desesperación.", "Edmund Burke" },
    { "El pensamiento es el ensayo de la acción.", "Sigmund Freud" },
    { "La sabiduría consiste en saber que se sabe lo que se sabe y en saber que no se sabe lo que no se sabe.", "Confucio" },
    { "Nada es tan difícil como no engañarse a uno mismo.", "Ludwig Wittgenstein" },
    { "Los límites de mi lenguaje son los límites de mi mundo.", "Ludwig Wittgenstein" },
    { "La duda es uno de los nombres de la inteligencia.", "Jorge Luis Borges" },
    { "Uno llega a ser lo que es por el olvido de lo que ha sido.", "Jorge Luis Borges" },
    { "No somos responsables de nuestras emociones, pero sí de lo que hacemos con ellas.", "Jorge Luis Borges" },
    { "He cometido el peor de los pecados: no he sido feliz.", "Jorge Luis Borges" },
    { "El tiempo es la sustancia de la que estoy hecho.", "Jorge Luis Borges" },
    { "Si el hombre no ha descubierto nada por lo que morir, no es digno de vivir.", "Martin Luther King" },
    { "Solo aquel que construye el futuro tiene derecho a juzgar el pasado.", "Friedrich Nietzsche" },
    { "La perfección se alcanza no cuando no hay nada más que añadir, sino cuando no hay nada más que quitar.", "Antoine de Saint-Exupéry" },
    { "Lo que da sentido a la vida es lo que le da sentido a la muerte.", "Antoine de Saint-Exupéry" },
    { "Vivir es lo más raro de este mundo. La mayoría de la gente existe, eso es todo.", "Oscar Wilde" },
    { "La vida es un bien perdido para aquel que no la ha vivido como hubiera querido.", "Mihai Eminescu" },
    { "Todo es viejo y todo es nuevo bajo el sol.", "Mihai Eminescu" },
    { "El tiempo pasa, el tiempo viene, todo es viejo y todo es nuevo.", "Mihai Eminescu" },
    { "¡Cuán lejos estamos de nosotros mismos!", "Mihai Eminescu" },
    { "La muerte es un brazo de sueño que nos libera del peso de la existencia.", "Mihai Eminescu" },
    { "El mundo es un sueño de nuestra alma.", "Mihai Eminescu" },
    { "No creas en nada de lo que ves, cree solo en lo que sientes dentro de ti.", "Mihai Eminescu" },
    { "Lo que ayer era un enigma, hoy es una amarga verdad.", "Mihai Eminescu" },
    { "Solo el genio no tiene muerte, pero tampoco tiene fortuna.", "Mihai Eminescu" },
    { "La historia de la humanidad es el despliegue del pensamiento de Dios.", "Mihai Eminescu" },
    { "No somos nosotros los que pasamos a través del tiempo, es el tiempo el que pasa a través de nosotros.", "Mihai Eminescu" },
    { "El hombre es una sombra que camina sobre un rayo de luna.", "Mihai Eminescu" },
    { "La música es la lengua de Dios, y el silencio es Su respuesta.", "Mihai Eminescu" },
}

local function wrap_text(text, width)
    local lines = {}
    local line = ""
    for word in text:gmatch("%S+") do
        if #line + #word + 1 > width then
            table.insert(lines, line)
            line = word
        else
            line = line == "" and word or line .. " " .. word
        end
    end
    table.insert(lines, line)
    return lines
end

function M.get_header()
    math.randomseed(os.time())
    local quote = M.lista[math.random(#M.lista)]
    local max_width = 50
    local wrapped = wrap_text("\"" .. quote[1] .. "\"", max_width)
    
    local header = { "", "" }
    
    for _, l in ipairs(wrapped) do
        table.insert(header, l)
    end
    
    table.insert(header, "")
    table.insert(header, "           — " .. quote[2])
    table.insert(header, "")
    
    return header
end

return M