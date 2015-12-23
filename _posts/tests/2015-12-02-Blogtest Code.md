---
layout: post
title: >-
    Blogtest: Programmacode
categories : [Test]
comments: false
---


### Code

Inline code is available with the `<code>` element. Snippets of multiple lines of code are supported through Pygments. Longer lines will automatically scroll horizontally when needed.

{% highlight js %}
// Example can be run directly in your JavaScript console

// Create a function that takes two arguments and returns the sum of those arguments
var adder = new Function("a", "b", "return a + b");

// Call the function
adder(2, 6);
// > 8
{% endhighlight %}

You may also optionally show code snippets with line numbers. Add `linenos` to the Pygments tags.

{% highlight js linenos %}
// Example can be run directly in your JavaScript console

// Create a function that takes two arguments and returns the sum of those arguments
var adder = new Function("a", "b", "return a + b");

// Call the function
adder(2, 6);
// > 8
{% endhighlight %}

**Toegevoegd door <u>Hans</u>**

Dit is Ruby:
{% highlight ruby linenos %}
def print_hi(name)
  puts "Hi, #{name}"
end
print_hi('Tom')
#=> prints 'Hi, Tom' to STDOUT.
{% endhighlight %}

Dit is Scala:
{% highlight scala linenos %}
//Voor de syntaxhighlighting, Scala
    def primeFactorMultiplicity: Map[Int,Int] = {
      def factorCount(n: Int, p: Int): (Int,Int) = 
        if (n % p != 0) (0, n)
        else factorCount(n / p, p) match { case (c, d) => (c + 1, d) }
      def factorsR(n: Int, ps: Stream[Int]): Map[Int, Int] = 
        if (n == 1) Map()
        else if (n.isPrime) Map(n -> 1)
        else {
          val nps = ps.dropWhile(n % _ != 0)
          val (count, dividend) = factorCount(n, nps.head)
          Map(nps.head -> count) ++ factorsR(dividend, nps.tail)
        }
      //Iets te printen
      println("Iets te printen")
      factorsR(start, primes)
{% endhighlight %}

En dit is Java:
{% highlight java linenos %}
	public static void main( String[] args){
        SwingUtilities.invokeLater(new Runnable() {
            public void run() {
                createAndShowGUIApplication();
            }
        });
	}
{% endhighlight %}

Kortom: het doet het, maar misschien kunnen dekleurtjes wat helderder.
