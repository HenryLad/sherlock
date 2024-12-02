using System;
using HtmlAgilityPack;

int MAX_AMOUNT_OF_LINKS = args.Length - 1;

string username = args[0];
Console.WriteLine($"Mark des Beidel hat den username: {username}");

string url = args[1];
HtmlWeb web = new HtmlWeb();
HtmlDocument doc = web.Load(url);


foreach (HtmlNode link in doc.DocumentNode.SelectNodes("//a[@href]"))
{
   HtmlAttribute attr = link.Attributes["href"];
   Console.WriteLine(attr.Value);
}

Console.WriteLine("Program finished");