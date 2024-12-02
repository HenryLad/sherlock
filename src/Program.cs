using System;
using HtmlAgilityPack;

int MAX_AMOUNT_OF_LINKS = args.Length - 1;

if (args.Length == 0)
{
    Console.WriteLine("No arguments provided.");
    return;
}

string username = args[0];
Console.WriteLine($"Mark des Beidel hat den username: {username}");

for (int i = 1; i < args.Length; i++)
{
    string url = args[i];
    HtmlWeb web = new HtmlWeb();
    HtmlDocument doc = web.Load(url);

    var nodes = doc.DocumentNode.SelectNodes("//a[@href]");
    if (nodes != null)
    {
        foreach (HtmlNode link in nodes)
        {
            HtmlAttribute attr = link.Attributes["href"];
            Console.WriteLine(attr.Value);
        }
    }
    else
    {
        Console.WriteLine($"No links found on {url}");
    }
}

Console.WriteLine("Program finished");