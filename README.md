This is a Ruby solution to the Flower Shop coding test. It contains following folders,
- bin: contains the `gen_bundles` script
- input: contains the example `order.txt`
- lib: production code
- spec: the RSpecs

# How to run the application

## Install dependencies
The application depends on some ruby gems, so before running the application run following command to install all dependencies (Assume `bundler` gem is already installed),

```
bundle install
```

This implementation depends on only one rubygem,
- rspec: For testing

## Run the application
To run the application, run following command,

```
./bin/gen_bundles input_txt
```

It contains one param,
- input_txt: The path of the order txt. An example file is at `input/order.txt`.

For example, the following command will output the bundles to the standard console.

```
./bin/gen_bundles ./input/order.txt
```

## Run tests
The application uses rspec as the test framework. Run following command to run all tests,

```
bundle exec rspec
```

# Application Design

## Assumption
This implementation makes some assumptions,
- If the application can't find a solution to fully bundle the flowers, it will raise an error.

## Algorithm Design
For this implementation I use a greedy algorithm. The solution is as following,
- Firstly sort the bundle rules (A bundle rule defines a price and a quantity) by quantity descending order
- Try to bundle using the first bundle rule (the one with biggest quantity) as many as possible until the remaining flowers are less than the rule quantity
- Then try to bundle using the next rule, and so on, until either the flowers are fully bundled or all bundle rules are tried
- If the flowers are fully bundled then we found the solution, however if after trying all bundle rules the flowers still are not fully bundled, then drop the biggest bundle rule and then start over again, which is a recursive action.


## Class Design
Here we give a brief explanation for each class.
- BundleApp : This is the entrypoint of the application.
- Flower: A Flower instance defines a flower which has a name, code and a list of bundle rules. This class also acts as active record and stores all flower instances
- BundleRule: A BundleRule instance defines a price and a quantity
- BundleResult: This is the bundle result returned by BundleCalculator. From it we can get the corresponding bundle rules and the count of the bundle rules
- BundleCalculator: This is the utility class for calculate BundleResult from a flower and a flower quantity
- BundleResultsWriter: This class is just to format and write a list of bundle results to standard console.
